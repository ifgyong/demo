//
//  FYCondLockDemo2.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYCondLockDemo2.h"

@interface FYCondLockDemo2(){
	NSConditionLock * _lock;
}
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation FYCondLockDemo2
- (instancetype)init{
	if (self = [super init]) {
		//遵守的 lock协议 的 条件🔐  默认值1
		_lock=[[NSConditionLock alloc]initWithCondition:1];
		self.array =[NSMutableArray array];
	}
	return self;
}
- (void)otherTest{
	[[[NSThread alloc]initWithTarget:self selector:@selector(__test2) object:nil] start];
	[[[NSThread alloc]initWithTarget:self selector:@selector(__test1) object:nil] start];
	[[[NSThread alloc]initWithTarget:self selector:@selector(__test3) object:nil] start];

}
- (void)__saleTicket{
	[_lock lock];
	[super __saleTicket];
	[_lock unlock];
}
- (void)__test1{
	[_lock lockWhenCondition:1];
	NSLog(@"%s",__func__);
	[_lock unlockWithCondition:2];//解锁 并赋值2
}
- (void)__test2{
	[_lock lockWhenCondition:2];
	NSLog(@"%s",__func__);
	[_lock unlockWithCondition:3];//解锁 并赋值3
}
- (void)__test3{
	[_lock lockWhenCondition:3];
	NSLog(@"%s",__func__);
	[_lock unlockWithCondition:4];//解锁 并赋值4
}
@end
