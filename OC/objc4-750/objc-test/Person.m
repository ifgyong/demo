//
//  Person.m
//  objc-test
//
//  Created by Charlie on 2019/5/27.
//

#import "Person.h"
#import <Foundation/Foundation.h>

@implementation Person
//+(void)load{
//	NSLog(@"%s",__func__);
//}

void testlog(id self,SEL _cmd);
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//	NSLog(@"%s",__func__);
//	if (sel == @selector(test)) {
//		Method me = class_getInstanceMethod(self, @selector(test2));
//		class_addMethod(self, sel,
//						method_getImplementation(me),
//						method_getTypeEncoding(me));
//		return YES;
//	}
//	return [super resolveInstanceMethod:sel];
//}
+ (id)forwardingTargetForSelector:(SEL)aSelector{
	if (aSelector == @selector(test)) {
		return [NSArray class];
	}
	return [super forwardingTargetForSelector:aSelector];
}
//+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//{
//	if (aSelector == @selector(test)) {
//		NSMethodSignature *sign = [NSMethodSignature signatureWithObjCTypes:"v@:"];
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
//
//	anInvocation.selector = @selector(test3);
//	anInvocation.target = (id)[Student class];
//
//	[anInvocation invoke];
//	NSLog(@"%s",__func__);
//}

@end
