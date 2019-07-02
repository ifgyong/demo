//
//  FYLogCenter.m
//  App
//
//  Created by Charlie on 2019/5/27.
//

#import "FYLogCenter.h"
#import <UIKit/UIKit.h>


#define AspectError(errorCode, errorDescription) do { \
AspectLogError(@"Aspects: %@", errorDescription); \
if (error) { *error = [NSError errorWithDomain:AspectErrorDomain code:errorCode userInfo:@{NSLocalizedDescriptionKey: errorDescription}]; }}while(0)
#define FYAspectOptionsFilter 0x3
#define FYAspect_selectorProfix @"FYAspect_"
@class FYHookClassSEL;



@implementation FYHookClass

-(NSMutableArray *)selsArray{
    if (_selsArray == nil) {
        _selsArray=[NSMutableArray array];
    }
    return _selsArray;
}

- (void)addHookClassSEL:(FYHookClassSEL *)_sel sel:(SEL) selector options:(HookOptions)ops block:(id)block{
    FYHookClassSEL *sel = [self containsHookClassSEL:_sel];
    if (sel) {
        [sel addBlock:block HookClassOptions:ops];
    }else{
        [self.selsArray addObject:_sel];
    }
}
-(FYHookClassSEL *)containsHookClassSEL:(FYHookClassSEL *)_sel{
    for (FYHookClassSEL * item in self.selsArray) {
        if ([NSStringFromSelector( item._SEL) isEqualToString:NSStringFromSelector(_sel._SEL)]) {
            return item;
        }
    }
    return nil;
}


@end

@implementation FYHookClassSEL

+ (instancetype)FYHookClassSEL:(SEL)sel options:(HookOptions)ops block:(dispatch_block_t)block{
    FYHookClassSEL  *cls =[FYHookClassSEL new];
    cls._SEL = sel;
    [cls addBlock:block HookClassOptions:ops];
    return cls;
}
- (void)addBlock:(id)block HookClassOptions:(HookOptions)ops{
    id blockCopy=[block copy];
    if ([self containsBlock:block options:ops] == NO) {
        switch (ops&FYAspectOptionsFilter) {
            case AspectPositionBefore:
                self.beforeSEL = [(self.beforeSEL ?:@[])arrayByAddingObject:blockCopy];
                break;
            case AspectPositionInstead:
                self.insteadSEL = [(self.insteadSEL ?:@[])arrayByAddingObject:blockCopy];
            case AspectPositionAfter:
                self.afterSEL = [(self.afterSEL ?:@[])arrayByAddingObject:blockCopy];
            default:
                break;
        }
    }
}
-(BOOL)containsBlock:(id)block options:(HookOptions)ops{
    switch (ops&FYAspectOptionsFilter) {
        case AspectPositionBefore:
            return [self.beforeSEL containsObject:block];
        case AspectPositionInstead:
            return [self.insteadSEL containsObject:block];
        case AspectPositionAfter:
            return [self.afterSEL containsObject:block];
        default:
            break;
    }
    return NO;
}
@end


@interface NSObject ()
@property (nonatomic,strong) NSMutableArray <FYHookClass *>*hookClassInfo;
@end

@implementation NSObject (FYLogCenter)
+ (void)load{
    NSLog(@"%s cls:%@",__func__,NSStringFromClass(self));

//    [self run];
}
const char **_clss;//获取所有的子类
NSMutableArray *_hookClassInfo;

-(NSMutableArray *)hookClassInfo{
    if (_hookClassInfo == nil) {
        _hookClassInfo=[NSMutableArray array];
    }
    return _hookClassInfo;
}

+(void)fyaspect_hookClass:(Class)aclass WithSelector:(SEL)selector withOptions:(HookOptions)options usingBlock:(id)block error:(NSError **)error{
    FYAspect_addSelector((id)aclass, selector, block, options, error);
}
-(void)fyaspect_hookClass:(Class)aclass WithSelector:(SEL)selector withOptions:(HookOptions)options usingBlock:(id)block error:(NSError **)error{
    FYAspect_addSelector((id)aclass, selector, block, options, error);
}
static void FYAspect_addSelector(NSObject * self,SEL selector,dispatch_block_t block,HookOptions ops,NSError ** error){
    NSCParameterAssert(self);
    NSCParameterAssert(selector);
    NSCParameterAssert(block);
    FYAspect_lock(^{
        if (FYAspect_isSelectorAllowedAndTrack(self, selector, ops, error)) {
            FYHookClass *hcls = FYAspect_getContainerForObject(self,selector);
            FYHookClassSEL *_sel=[FYHookClassSEL FYHookClassSEL:selector options:ops block:block];
            [hcls addHookClassSEL:_sel sel:selector options:ops block:block];
            [self run];
        }
    });
}
//单例加锁
static void FYAspect_lock(dispatch_block_t block){
    static dispatch_once_t onceTokenLock;
    static NSLock * _lock;
    dispatch_once(&onceTokenLock, ^{
        _lock = [[NSLock alloc]init];
    });
    [_lock lock];
    block();
    [_lock unlock];
}
//是否能被track
static BOOL FYAspect_isSelectorAllowedAndTrack(NSObject * self,SEL selector,HookOptions ops,NSError ** error){
    static dispatch_once_t onceTokenSets;
    static NSSet *disallowSelectorList;
    dispatch_once(&onceTokenSets, ^{
        disallowSelectorList =[NSSet setWithObjects:@"retain",@"release",@"autorelease",@"forwardInvocation", nil];
    });
    NSString *selName = NSStringFromSelector(selector);
    HookOptions position = ops&FYAspectOptionsFilter;
    if ([disallowSelectorList containsObject:selName]) {
        return NO;
    }else if ([selName isEqualToString:@"dealloc"] && position != AspectPositionBefore) {
        return NO;
    }else if ([self respondsToSelector:selector] == NO &&[self.class  instancesRespondToSelector:selector] == NO){
        return NO;
    }else {
//        if (1) {
//
//        }
    }
    return YES;
}
//获取sel的存储对象
static  FYHookClass* FYAspect_getContainerForObject(NSObject * self,SEL selector){
    NSCParameterAssert(self);
//    SEL newSel = FYAspect_getAliasForSel(selector);
    Class aSlass = self.class;
//    aSlass = "123";
    FYHookClass *hcls = objc_getAssociatedObject(self, CFBridgingRetain(aSlass));
    if (hcls == nil) {
        hcls =[FYHookClass new];
        objc_setAssociatedObject(self, CFBridgingRetain(aSlass), hcls, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return hcls;
}
static SEL FYAspect_getAliasForSel(SEL selector){
    NSCParameterAssert(selector);
    return NSSelectorFromString([FYAspect_selectorProfix stringByAppendingFormat:@"_%@",NSStringFromSelector(selector)]);
}
- (void)run{
    
    [self getAllClassInfoWithClass];
}
static void FYAspect_addLog(NSObject * self){

}


- (void)getAllClassInfoWithClass{
    static unsigned int count = 0;
    static Dl_info info;
    if (_clss == nil) {
        dladdr(&_mh_execute_header, &info);
        _clss = objc_copyClassNamesForImage(info.dli_fname,&count);
    }
    unsigned int countSub = count;
    for (unsigned int i = 0; i <countSub; i ++) {
        NSString *name = [NSString stringWithCString:_clss[i] encoding:NSUTF8StringEncoding];
        Class aclass = NSClassFromString(name);
        if ([aclass isSubclassOfClass:UIViewController.class]) {
            
            NSLog(@"name:%@",name);
            FYHookClass *cles = FYAspect_getContainerForObject(self, nil);
            if ([[cles selsArray] count] > 0 ) {
                for (FYHookClassSEL *subItem in cles.selsArray) {
                    SEL didload = subItem._SEL;
                    Method md = class_getInstanceMethod(aclass, didload);
                    //获取didload函数的的IMP
                    IMP load = method_getImplementation(md);
                    void(*loadFunc)(id,SEL) = (void *)load;
                    
                    if (md) {
                        __block typeof(Class) __blockClass = aclass;
                        //                    __block typeof(IMP) __blockIMP = load;
                        __block typeof(loadFunc)__blockFunc = loadFunc;
                        __block typeof(subItem) __blockItem = subItem;
                        void (^block)(id _self) = ^(id _self){
                            //call before func
                            if (__blockItem.beforeSEL.count > 0) {
                                for (id blockSub in __blockItem.beforeSEL) {
                                    IMP impSub = imp_implementationWithBlock(blockSub);
                                    void(*loadFuncBefore)(id,SEL) = (void *)impSub;
                                    loadFuncBefore(aclass,NULL);
                                }
                            }
                            
                            
                            //call instead func
                            if (__blockItem.insteadSEL.count > 0) {
                                for (id blockSub in __blockItem.insteadSEL) {
                                    IMP impSub = imp_implementationWithBlock(blockSub);
                                    void(*loadFuncInstead)(id,SEL) = (void *)impSub;
                                    loadFuncInstead(aclass,NULL);
                                }
                            }else{
                                //统计时间
                                CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
                                //执行ViewDidLoad IMP
                                __blockFunc(aclass,NULL);
                                NSLog(@"%s %.2f",class_getName(__blockClass),CFAbsoluteTimeGetCurrent() - time1);
                            }
                            
                            //call after func
                            if (__blockItem.afterSEL.count > 0) {
                                for (id blockSub in __blockItem.afterSEL) {
                                    IMP impSub = imp_implementationWithBlock(blockSub);
                                    void(*loadFuncafter)(id,SEL) = (void *)impSub;
                                    loadFuncafter(aclass,NULL);
                                }
                            }
                            
                            
                        };
                        //将 block block 转化成 IMP 存储到SEL ViewDidload 中
                        if (FYAspect_getClassBlockSetCount(self, didload) == 0) {
                            FYAspect_setClassBlockCount(self, didload, 1);
                            void(*func)(id,SEL) =(void*)imp_implementationWithBlock(block);
                            class_replaceMethod(aclass, didload, (IMP)func, method_getTypeEncoding(md));
                        }
                    }
                }
            }else{
                NSArray *sels=@[@"viewDidLoad",@"viewWillAppear:"];
                NSInteger countSels = sels.count;
                for (NSInteger i = 0; i < countSels; i ++) {
                    NSString *selName = [sels objectAtIndex:i];
                    SEL didload = NSSelectorFromString(selName);
                    Method md = class_getInstanceMethod(aclass, didload);
                    if (md) {
                        //获取didload函数的的IMP
                        IMP load = method_getImplementation(md);
                        void(*loadFunc)(id,SEL) = (void *)load;
                        __block typeof(Class) __blockClass = aclass;
                        //                    __block typeof(IMP) __blockIMP = load;
                        __block typeof(loadFunc)__blockFunc = loadFunc;
                        __block typeof(NSString*)__blockSelName = selName;
                        void (^block)(id _self) = ^(id _self){
                            //统计时间
                            CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
                            //执行ViewDidLoad IMP
                            __blockFunc(aclass,NULL);
                            NSLog(@"%s %@ %.2f",class_getName(__blockClass),__blockSelName,CFAbsoluteTimeGetCurrent() - time1);
                        };
                        //将 block block 转化成 IMP 存储到SEL ViewDidload 中
                        if (FYAspect_getClassBlockSetCount((id)aclass, didload) == 0) {
                            FYAspect_setClassBlockCount((id)aclass, didload, 1);
                            void(*func)(id,SEL) =(void*)imp_implementationWithBlock(block);
                            class_replaceMethod(aclass, didload, (IMP)func, method_getTypeEncoding(md));
                        }
                }
                }
            }
        }
    }
}
static int FYAspect_getClassBlockSetCount(NSObject * self,SEL selector){
    int count = 0;
    count = [objc_getAssociatedObject(self, selector) intValue];
    return count;
}
static void FYAspect_setClassBlockCount(NSObject * self,SEL selector,int count){
    NSCParameterAssert(self);
    NSCParameterAssert(selector);
    objc_setAssociatedObject(self, selector, [NSString stringWithFormat:@"%d",count], OBJC_ASSOCIATION_COPY);
}
//static void FYAspect_callBlock(NSArray * array){
//    
//}
//是否可以被hook
- (BOOL)isCanHookClass:(Class)cls {
    return [cls isSubclassOfClass:UIViewController.class];
}
//获取系统的
- (NSArray *)getViewControllerSubClass:(Class)parentClass{
    int count = objc_getClassList(NULL, 0);
//    const char ** classed;
    Class *classes = NULL;
    classes =(__unsafe_unretained Class*) malloc(sizeof(Class) * count);
    count = objc_getClassList(classes, count);
    NSMutableArray *res =[NSMutableArray array];
    for (int i = 0; i < count ; i ++) {
        Class superClass = classes[i];
        do {
            superClass = class_getSuperclass(superClass);
        } while (superClass && superClass != parentClass);
        if (superClass == nil) {
            continue;
        }
        [res addObject:classes[i]];
        
    }
    free(classes);
    return [res copy];
}
@end
