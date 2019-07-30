//
//  FYProxy.m
//  day17-定时器
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYProxy.h"

@implementation FYProxy
- (void)dealloc{
	NSLog(@"%s",__func__);
}
+ (instancetype)proxyWithTarget:(id)target{
	FYProxy *obj=[FYProxy alloc];
	obj.target = target;
	return obj;
}
- (void)forwardInvocation:(NSInvocation *)invocation{
	[invocation invokeWithTarget:self.target];
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
	return [self.target methodSignatureForSelector:sel];
}
@end
