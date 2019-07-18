//
//  Person.m
//  day12-消息转发1
//
//  Created by fgy on 2019/7/17.
//  Copyright © 2019 test. All rights reserved.
//

#import "Person.h"
#import "Student.h"

@implementation Person

//class 转发
// 消息转发第一步 拦截是否有转发的x对象处理方法
+ (id)forwardingTargetForSelector:(SEL)aSelector{
	if (aSelector == @selector(test3)) {
		//objc_msgSend([[Struent alloc]init],test)
		return [Student class];//[[Student alloc]init];
	}
	return [super forwardingTargetForSelector:aSelector];
}
//消息转发第二步 没有对象来处理方法，那将函数签名来实现
//+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//{
//	if (aSelector == @selector(test3)) {
//		NSMethodSignature *sign = [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
//		return sign;
//	}
//	return [super methodSignatureForSelector:aSelector];
//}
//// 函数签名已返回，到了函数调用的地方
////selector 函数的sel
////target   函数调用者
////methodSignature 函数签名
////NSInvocation  封装数据的对象
//+ (void)forwardInvocation:(NSInvocation *)anInvocation{
//	anInvocation.selector = @selector(test2);
//	anInvocation.target = (id)[[Student alloc]init];
//	[anInvocation invoke];
//	NSLog(@"%s",__func__);
//}
@end

