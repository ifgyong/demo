//
//  UIViewController+add.m
//  FYRuntimeAOP
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "UIViewController+add.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <libkern/OSAtomic.h>
#import "Aspects.h"

static NSString * const FYAOPMessagePrefix = @"FYAOPMessagePrefix_";
static NSString * const FYAOPMessageSubClassSuffix = @"_FYAOPMessageSubClassSuffix_";


@implementation UIViewController (add)
+ (void)load{
    [UIViewController getAllViewControllerDownDidLoadTime];
}
+(instancetype)fy_alloc{
    return [UIViewController fy_alloc];
}
+ (void)initialize
{
    NSArray *classList = @[@"UITabBarController",@"UINavigationController",@"UIViewController"];
    if ([self isSubclassOfClass:[UIViewController class]] &&
        [classList containsObject:NSStringFromClass(self)] == NO) {
        NSLog(@"%@",NSStringFromClass(self.class));
//        [self fy_exchangeDidLoad:self.class];
        fy_setAllHookClassAndSel(self);
    }
}
static void fy_setAllHookClassAndSel(Class self){
    fy_set_hookClassObj(self, @selector(viewDidLoad));
    fy_set_hookClassObj(self, @selector(init));
}
static void fy_set_hookClassObj(Class  obj,SEL sel){
    CFAbsoluteTime before = 0.0 ;
    CFAbsoluteTime after = 0.0 ;
    __block typeof(CFAbsoluteTime)  __before = before;
    __block typeof(CFAbsoluteTime) __after = after;
    [obj aspect_hookSelector:sel
                  withOptions:AspectPositionBefore
                   usingBlock:^(){
                       __before = CFAbsoluteTimeGetCurrent();
                   } error:nil];
    [obj aspect_hookSelector:sel
                  withOptions:AspectPositionAfter
                   usingBlock:^(){
                       __after = CFAbsoluteTimeGetCurrent();
                       NSLog(@"%@ is cost:%.2f",NSStringFromSelector(sel),__after - __before);
                   } error:nil];
}
+ (void)fy_exchangeDidLoad:(Class)cl{
    Class vcclass = cl;
    Method vcloadMethod = class_getInstanceMethod(vcclass, @selector(viewDidLoad));
    Method new_loadMethod = class_getInstanceMethod(self.class, @selector(fy_viewControllerDidLoad));
    if (vcloadMethod && new_loadMethod) {
        static dispatch_once_t onceToken;
        if (!class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(vcloadMethod), method_getTypeEncoding(vcloadMethod))) {
            method_exchangeImplementations(vcloadMethod, new_loadMethod);
            dispatch_once(&onceToken, ^{
//                method_exchangeImplementations(vcloadMethod, new_loadMethod);
            });
        }
    }
}
static void fy_aspects_prepareClassAndHookSelector(NSObject * self,SEL aSelector ,NSError ** error){
    Class kclass = getSubClass(self, error);
    Method target = class_getInstanceMethod(kclass, aSelector);
    IMP targetIMP= method_getImplementation(target);
    if (!fy_aspects_getMsgForwardIMP(targetIMP)) {
        const char * typeEncoding = method_getTypeEncoding(target);
        SEL  liasSel = fy_aspect_aliasForSelector(aSelector);
        if ([kclass instancesRespondToSelector:liasSel]) {
            __unused BOOL addedAlias = class_addMethod(kclass, liasSel, method_getImplementation(target), typeEncoding);
//            NSLog(@" class addMethod");
        }
        class_replaceMethod(kclass, aSelector, fy_asept_getMsgForwardIMP(self, liasSel), typeEncoding);
    }
}
static IMP fy_asept_getMsgForwardIMP(NSObject * self,SEL selector){
    IMP msgForwardIMP = _objc_msgForward;
    return msgForwardIMP;
}
static BOOL fy_aspects_getMsgForwardIMP(IMP impl){
    return impl == _objc_msgForward;
}
static SEL fy_aspect_aliasForSelector(SEL selector){
    return NSSelectorFromString([FYAOPMessagePrefix stringByAppendingString:[NSString stringWithFormat: @"_%@",NSStringFromSelector(selector)]]);
}
static void __ASPECTS_ARE_BEING_CALLED__(__unsafe_unretained NSObject * self,SEL aSelector,NSInvocation * invocation){
    
}
static Class getSubClass(NSObject * self,NSError ** error){
//    Class stateClass = self.class;
    Class baseClass = object_getClass(self);
    NSString *className = NSStringFromClass(baseClass);
    if ([className hasPrefix:FYAOPMessageSubClassSuffix]) {
        return baseClass;
    }else if(class_isMetaClass(baseClass)){
        
    }else{
        const char *subClassName =[className stringByAppendingString:FYAOPMessageSubClassSuffix].UTF8String;
        Class subclass = objc_getClass(subClassName);
        if (subclass == nil){
            subclass = objc_allocateClassPair(baseClass, subClassName, 0);
            if (subclass == nil) {
                NSString *errorDesc =[NSString stringWithFormat:@"objc_alllocateClassPair faild to allocate class %s",subClassName];
                NSLog(@"%@",errorDesc);
                return nil;
            }
            fy_aspect_swizzleForWardInvocation(subclass);
            fy_aspect_hookGetClass(subclass, baseClass);
            fy_aspect_hookGetClass(object_getClass(subclass), baseClass);
            objc_registerClassPair(subclass);
            object_setClass(self, subclass);
        }
        return subclass;
    }
    return nil;
}
static void fy_aspect_swizzleForWardInvocation(Class kclass){
    IMP originIMP = class_replaceMethod(kclass, @selector(forwardInvocation:), (IMP)__ASPECTS_ARE_BEING_CALLED__, "v@:@");
    if (originIMP) {
        class_addMethod(kclass,NSSelectorFromString(@"__aspects_forwardInvocation:"), originIMP, "v@:@");
    }
}
//替换class 方法
static void fy_aspect_hookGetClass(Class cl,Class baseClass){
    Method metod=class_getInstanceMethod(cl, @selector(class));
    IMP newIMP= imp_implementationWithBlock(^(id self){
        return baseClass;
    });
    class_replaceMethod(cl, @selector(class), newIMP, method_getTypeEncoding(metod));
}
+ (void)getAllViewControllerDownDidLoadTime{
    
    {
//        Method alloc = class_getClassMethod(vcclass, @selector(alloc));
//        Method new_alloc = class_getClassMethod(vcclass, @selector(fy_alloc));
//        if (alloc && new_alloc) {
//            static dispatch_once_t onceToken2;
//            dispatch_once(&onceToken2, ^{
//               // method_exchangeImplementations(alloc, new_alloc);
//            });
//        }
    }
}
- (void)fy_say{
    NSLog(@"%s",__func__);
}
- (void)fy_viewControllerDidLoad{
    dispatch_async(dispatch_get_main_queue(), ^{
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        [self fy_viewControllerDidLoad];
        CFAbsoluteTime longtime = CFAbsoluteTimeGetCurrent() - now;
        printf("start:%f finish:%.2f %s\n ",now,longtime,NSStringFromClass(self.class).UTF8String);
    });
}
- (void)logSelf{
    printf("%s :%s\n",__func__,NSStringFromClass(self.class).UTF8String);
}
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"%@",NSStringFromSelector(anInvocation.selector));
}
- (id)forwardingTargetForSelector:(SEL)aSelector{
    return self;
}
@end
