//
//  Person.m
//  objc-test
//
//  Created by Charlie on 2019/5/27.
//

#import "Person.h"

@implementation Person
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
-(void)test2{
	NSLog(@"来了，老弟");
}
+ (void)test3{
	NSLog(@"来了，老弟");
}
+ (BOOL)resolveClassMethod:(SEL)sel{
	NSLog(@"%s",__func__);
	if (sel == @selector(test)) {
		Method me = class_getClassMethod(self, @selector(test3));
		class_addMethod(object_getClass(self), sel,
						method_getImplementation(me),
						method_getTypeEncoding(me));
		return YES;
	}
	return [super resolveInstanceMethod:sel];
}
void testlog(id self,SEL _cmd){
	NSLog(@"我是%@,%@ 来了，老弟,",self,_cmd);
}

@end
