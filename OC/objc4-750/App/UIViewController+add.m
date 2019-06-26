//
//  UIViewController+add.m
//  App
//
//  Created by Charlie on 2019/6/26.
//

#import "UIViewController+add.h"
#import <objc/runtime.h>
#import <objc/message.h>


@implementation UIViewController (add)

+(void)load{
	[UIViewController exchange];
	[UIViewController exchange];
}
+ (void)exchange{
	Method m1 = class_getInstanceMethod(UIViewController.class, @selector(viewDidLoad));
	Method m2 = class_getInstanceMethod(self, @selector(fy_viewDidload));
	NSLog(@"viewDidLoad excheng before:%p",method_getImplementation(m1));
	NSLog(@"fy_viewDidload excheng before:%p",method_getImplementation(m2));
	if (!class_addMethod(self, @selector(fy_viewDidload), method_getImplementation(m2), method_getTypeEncoding(m2))) {
		method_exchangeImplementations(m1, m2);
	}
	NSLog(@"viewDidLoad excheng after:%p",method_getImplementation(m1));
	NSLog(@"fy_viewDidload excheng after:%p",method_getImplementation(m2));
}
- (void)fy_viewDidload{
/*
 统计的代码
 */
	[self fy_viewDidload];
}
    


@end
