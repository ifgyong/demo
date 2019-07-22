//
//  FYPerson.m
//  day13-super
//
//  Created by Charlie on 2019/7/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson.h"

@implementation FYPerson
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
	if ([self respondsToSelector:aSelector]) {
		return [super methodSignatureForSelector:aSelector];
	}
	return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation{
	NSLog(@"%@ 没实现 %@",anInvocation.target,NSStringFromSelector( anInvocation.selector));
}
@end
