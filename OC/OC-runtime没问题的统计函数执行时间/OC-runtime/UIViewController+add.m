//
//  UIViewController+add.m
//  OC-runtime
//
//  Created by Charlie on 2019/8/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "UIViewController+add.h"
#import "objc/runtime.h"

@implementation UIViewController (add)
+ (void)load{

}
static NSMutableSet *set;
+(void)initialize{
//    [self fy_viewDidLoad];
    
    
    
}
//统计其他的子类的viewDidLoad方法时长
+ (void)fy_viewDidLoad{
    if (set== nil) {
        set = [[NSMutableSet alloc]init];
    }
    //UIViewcontroller的子类统计
    if ([self isSubclassOfClass:UIViewController.class] &&
        self != UIViewController.class) {
        if ([set containsObject:self]) {
            return;
        }else{
            [set addObject:self];
        }
        SEL sel = @selector(viewDidLoad);
        Method m1 = class_getInstanceMethod(self, @selector(viewDidLoad));
        IMP imp1 = method_getImplementation(m1);
        // id,SEL 必须传，否则到了执行imp1Func(i,s);内部的id是nil，导致函数无法执行。
        void(*imp1Func)(id,SEL) = (void*)imp1;//imp1原始方法地址
        void (^block)(id,SEL)  = ^(id i,SEL s){
            printf("开始\n");
            NSDate *date =[NSDate new];
            imp1Func(i,s);
            NSLog(@"%@ time:%d", NSStringFromClass(self),(int)[[NSDate date] timeIntervalSinceDate:date]);
            printf("结束\n");
        };
        IMP imp2 = imp_implementationWithBlock(block);
        class_replaceMethod(self, sel, imp2, method_getTypeEncoding(m1));
        
    }

}
@end
