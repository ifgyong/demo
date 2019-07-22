//
//  UIButton+add.m
//  day14-方法交换
//
//  Created by Charlie on 2019/7/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "UIButton+add.h"
#import "objc/runtime.h"

@implementation UIButton (add)
+ (void)load{
	Method m1= class_getInstanceMethod(self.class, @selector(sendAction:to:forEvent:));
	Method m2= class_getInstanceMethod(self.class, @selector(fy_sendAction:to:forEvent:));
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		method_exchangeImplementations(m1, m2);
	});

}
- (void)fy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
	NSLog(@"%@ ",NSStringFromSelector(action));
	/*
	 code here
	 */
	//sel IMP 已经交换过了，所以不会死循环
	[self fy_sendAction:action to:target forEvent:event];
}
@end
