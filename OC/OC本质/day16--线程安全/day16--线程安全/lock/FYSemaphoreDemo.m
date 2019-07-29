//
//  FYSemaphoreDemo.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYSemaphoreDemo.h"
@interface FYSemaphoreDemo(){
	dispatch_semaphore_t _semaphore;
}@end
@implementation FYSemaphoreDemo

- (instancetype)init{
	if (self =[super init]) {
		_semaphore = dispatch_semaphore_create(1);
	}
	return self;
}
- (void)otherTest{
	for (int i = 0; i < 10; i ++) {
		[[[NSThread alloc]initWithTarget:self selector:@selector(test) object:nil]start];
	}
}
- (void)test{
//	_semaphore = dispatch_semaphore_create(1);
	//如果信号量>0 ，让信号量-1，继续向下执行。
	//如果信号量 <= 0;就会等待
	dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
	sleep(2);
	NSLog(@"%@",[NSThread currentThread]);
	//释放一个信号量
	dispatch_semaphore_signal(_semaphore);
}
- (void)__saleTicket{
	//信号量为为1 作为锁使用。
	dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
	[super __saleTicket];
	dispatch_semaphore_signal(_semaphore);
}
- (void)__getMonery{
	dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
	[super __getMonery];
	dispatch_semaphore_signal(_semaphore);
}
- (void)__saveMonery{
	dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
	[super __saveMonery];
	dispatch_semaphore_signal(_semaphore);
}

@end
