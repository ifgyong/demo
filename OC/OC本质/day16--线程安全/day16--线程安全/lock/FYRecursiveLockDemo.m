//
//  FYRecursiveLockDemo.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYRecursiveLockDemo.h"
@interface FYRecursiveLockDemo(){
	NSRecursiveLock *_lock;
}
@end

@implementation FYRecursiveLockDemo
- (instancetype)init{
	if (self = [super init]) {
		//封装了mutex的递归锁
		_lock=[[NSRecursiveLock alloc]init];
	}
	return self;
}
- (void)__saleTicket{
	[_lock lock];
	[super __saleTicket];
	[_lock unlock];
}
- (void)otherTest{
	[[[NSThread alloc]initWithTarget:self selector:@selector(testTwice:) object:@(6)]start];
	[[[NSThread alloc]initWithTarget:self selector:@selector(testTwice:) object:@(5)]start];
}
-(void)testTwice:(NSNumber*)countNum{
	int count = countNum.intValue;
	[_lock lock];
	while (count > 0) {
		count -= 1;
		printf("循环% 2d次 - %s \n",count,[NSThread currentThread].description.UTF8String);
		[self testTwice:@(count)];
	}
	[_lock unlock];
}
@end
