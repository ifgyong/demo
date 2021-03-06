//
//  UIViewController+add.m
//  OC-runtime
//
//  Created by Charlie on 2019/8/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "UIViewController+add.h"
#import "objc/runtime.h"
#import "BaseViewController.h"

@implementation UIViewController (add)

+(void)load{
//	Method m1 = class_getInstanceMethod(self, @selector(fy_viewDidload));
//	Method m2 = class_getInstanceMethod(UIViewController.class, @selector(viewDidLoad));
//
//	method_exchangeImplementations(m2,m1);//交换view
//	
//	Method m11 = class_getInstanceMethod(UIViewController.class, @selector(viewWillAppear:));
//	Method m12 = class_getInstanceMethod(self.class, @selector(fy_viewWillAppear:));
//	method_exchangeImplementations(m11, m12);

}
- (void)fy_viewWillAppear:(BOOL)animated{
	printf("fy_viewWillAppear %s\n",NSStringFromClass(self.class).UTF8String);

}
- (void)fy_viewDidload{
	printf("fy_viewDidload %s\n",NSStringFromClass(self.class).UTF8String);
}
- (instancetype)fy_replaceViewDidloadIMP{
	
	unsigned int count =0 ;
	Class *cls = objc_copyClassList(&count);
	for (int i = 0; i < count; i ++) {
		Class sub = cls[i];
		if ([sub isSubclassOfClass:UIViewController.class]) {
			Class supClas = [sub superclass];
			Class newSub = objc_allocateClassPair(self.class, "fy_class", 0);
			if (set== nil) {
				set = [[NSMutableSet alloc]init];
			}
			//UIViewcontroller的子类统计
			if ([sub isSubclassOfClass:UIViewController.class] &&
				sub != UIViewController.class) {
				if ([set containsObject:sub]) {
					break;
				}else{
					[set addObject:sub];
				}
				SEL sel = @selector(viewDidLoad);
				Method m1 = class_getInstanceMethod(sub, @selector(viewDidLoad));
				IMP imp1 = method_getImplementation(m1);
				// id,SEL 必须传，否则到了执行imp1Func(i,s);内部的id是nil，导致函数无法执行。
				void(*imp1Func)(id,SEL) = (void*)imp1;//imp1原始方法地址
				void (^block)(id,SEL)  = ^(id i,SEL s){
					UIViewController * name = (UIViewController *)i;
					const char *nameChar = NSStringFromClass(name.class).UTF8String;
					NSDate * old = [NSDate date];
					printf("开始 %s %s\n",nameChar,old.description.UTF8String);
					imp1Func(i,s);//viewDidLoad
					printf("结束 %s %f\n",nameChar,[[NSDate date] timeIntervalSinceDate:old]);
				};
				IMP imp2 = imp_implementationWithBlock(block);
				class_replaceMethod(sub, sel, imp2, method_getTypeEncoding(m1));
			}
		}
	}
	free(cls);
	return [super init];
}

static NSMutableSet *set;

+(void)initialize{
//	static dispatch_once_t onceToken;
//	dispatch_once(&onceToken, ^{
//		[self fy_countViewDidLoad];
//	});
//[self fy_countViewDidLoad];
}
//统计其他的子类的viewDidLoad方法时长
+ (void)fy_countViewDidLoad{
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
			UIViewController * name = (UIViewController *)i;
			const char *nameChar = NSStringFromClass(name.class).UTF8String;
			NSDate * old = [NSDate date];
            printf("开始 %s %s\n",nameChar,old.description.UTF8String);
			imp1Func(i,s);//viewDidLoad
			printf("结束 %s %f\n",nameChar,[[NSDate date] timeIntervalSinceDate:old]);
        };
        IMP imp2 = imp_implementationWithBlock(block);
        class_replaceMethod(self, sel, imp2, method_getTypeEncoding(m1));
    }
}
@end
