//
//  FYLogCenter.m
//  App
//
//  Created by Charlie on 2019/5/27.
//

#import "FYLogCenter.h"
#import <UIKit/UIKit.h>

@interface FYLogCenter (){
    const char **_clss;
}

@end

@implementation FYLogCenter
+ (instancetype)defaultCenter{
    static dispatch_once_t onceToken;
    static FYLogCenter *item=nil;
    dispatch_once(&onceToken, ^{
        item=[FYLogCenter new];
    });
    return item;
}
- (void)run{
    [self getAllClassInfo];
//    NSArray *list = [self getViewControllerSubClass:UIViewController.class];
//    for (Class item in list) {
//        NSLog(@"%@",NSStringFromClass(item));
//    }
}


- (void)getAllClassInfo{
    unsigned int count = 0;
    Dl_info info;
    dladdr(&_mh_execute_header, &info);
    _clss = objc_copyClassNamesForImage(info.dli_fname,&count);
    for (unsigned int i = 0; i <count; i ++) {
        NSString *name = [NSString stringWithCString:_clss[i] encoding:NSUTF8StringEncoding];
        Class aclass = NSClassFromString(name);
        if ([aclass isSubclassOfClass:UIViewController.class]) {
            NSLog(@"name:%@",name);
            if (1) {
                SEL didload = @selector(viewDidLoad);
                
                Method md = class_getInstanceMethod(aclass, didload);
                IMP load = method_getImplementation(md);
                void(*loadFunc)(id,SEL) = (void *)load;
                if (md) {
                    __block typeof(Class) __blockClass = aclass;
//                    __block typeof(IMP) __blockIMP = load;
                    __block typeof(loadFunc)__blockFunc = loadFunc;
                    void (^block)(id _self) = ^(id _self){
//                        Class cl = (Class )_self;
//                        NSLog(@"class=%s",class_getName(cl));
                        CFAbsoluteTime time1= CFAbsoluteTimeGetCurrent();
                        __blockFunc(aclass,NULL);
                        NSLog(@"%s %.2f",class_getName(__blockClass),CFAbsoluteTimeGetCurrent() - time1);
//                        SEL _sel = sel_registerName("fy_ViewDidLoad");
//                        Method md2 = class_getInstanceMethod(__blockClass, _sel);
//                        if (md2) {
//
//                        }else{
//                            BOOL add = class_addMethod(aclass, _sel, __blockIMP, method_getTypeEncoding(md));
//                            if (add) {
//                                [aclass performSelector:_sel];
//                            }
//                        }
                        
                    };
                    void(*func)(id,SEL) =(void*)imp_implementationWithBlock(block);
                    class_replaceMethod(aclass, didload, (IMP)func, method_getTypeEncoding(md));
                }
            }
        }
    }
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
