//
//  UIViewController+add.m
//  FYRuntimeAOP
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "UIViewController+add.h"
#import <objc/runtime.h>

@implementation UIViewController (add)
+ (void)load{
    [UIViewController getAllViewControllerDownDidLoadTime];
}
+(instancetype)fy_alloc{
    return [UIViewController fy_alloc];
}
+ (void)getAllViewControllerDownDidLoadTime{
    Class vcclass = [self class];
    Method vcloadMethod = class_getInstanceMethod(vcclass, @selector(viewDidLoad));
    Method new_loadMethod = class_getInstanceMethod(vcclass, @selector(fy_viewControllerDidLoad));
    

    if (vcloadMethod && new_loadMethod) {
        static dispatch_once_t onceToken;
        if (!class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(vcloadMethod), method_getTypeEncoding(vcloadMethod))) {
            dispatch_once(&onceToken, ^{
                method_exchangeImplementations(vcloadMethod, new_loadMethod);
            });
        }
       
    }
    {
        Method alloc = class_getClassMethod(vcclass, @selector(alloc));
        Method new_alloc = class_getClassMethod(vcclass, @selector(fy_alloc));
        if (alloc && new_alloc) {
            static dispatch_once_t onceToken2;
            dispatch_once(&onceToken2, ^{
                method_exchangeImplementations(alloc, new_alloc);
            });
        }
    }
}
- (void)fy_viewControllerDidLoad{
    dispatch_async(dispatch_get_main_queue(), ^{
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
//        [self fy_viewControllerDidLoad];
        [self logSelf];
        CFAbsoluteTime longtime = CFAbsoluteTimeGetCurrent() - now;
        NSLog(@"start:%f finish:%.2f",now,longtime);
    });
}
- (void)logSelf{
    NSLog(@"%s :%@",__func__,NSStringFromClass(self.class));
}
@end
