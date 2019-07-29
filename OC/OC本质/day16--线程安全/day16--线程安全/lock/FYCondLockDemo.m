//
//  FYCondLockDemo.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYCondLockDemo.h"
@interface FYCondLockDemo(){
	NSCondition * _lock;
}
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation FYCondLockDemo
- (instancetype)init{
	if (self = [super init]) {
		//遵守的 lock协议 的 条件🔐
		_lock=[[NSCondition alloc]init];
		self.array =[NSMutableArray array];
	}
	return self;
}
- (void)__saleTicket{
	[_lock lock];
	[super __saleTicket];
	[_lock unlock];
}
- (void)otherTest{
	[[[NSThread alloc]initWithTarget:self selector:@selector(__remove) object:nil] start];
	[[[NSThread alloc]initWithTarget:self selector:@selector(__add) object:nil] start];
}
- (void)__add{
	
	[_lock lock];
	NSLog(@"%s 加锁成功",__func__);
	sleep(1);
	[self.array addObject:@"Test"];
	NSLog(@"添加成功");
	
	[_lock signal];//唤醒一个线程
	[_lock unlock];//解锁
	NSLog(@"%s 解锁成功",__func__);
}
- (void)__remove{
	[_lock lock];//加锁
	NSLog(@"%s 加锁成功",__func__);
	if (self.array.count == 0) {
		[_lock wait];//等待 阻塞线程
	}
	[self.array removeLastObject];
	NSLog(@"删除成功");

	[_lock unlock];//打开锁
	NSLog(@"%s 解锁成功",__func__);

}
@end
