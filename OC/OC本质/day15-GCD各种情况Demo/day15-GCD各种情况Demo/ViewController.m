//
//  ViewController.m
//  day15-GCD各种情况Demo
//
//  Created by Charlie on 2019/7/24.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (assign,atomic) NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
//	self.count = 10;
	[self asyn_semaphore];
}
- (void)apply{
	dispatch_apply(1, dispatch_get_global_queue(0, 0), ^(size_t idx) {
//		printf("\n %s %s ",[self dateUTF8],[self threadInfo]);
		[self sync_buy_tick];
	});
}
- (void)print{
	printf("\n %s %s ",[self dateUTF8],[self threadInfo]);
}
//延迟执行 在子线程
-(void)dispatch_after{
	printf("\n %s %s begin",[self dateUTF8],[self threadInfo]);
	dispatch_queue_t queue= dispatch_queue_create("com.sub.thread", DISPATCH_QUEUE_CONCURRENT);
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), queue, ^{
		printf("\n %s %s",[self dateUTF8],[self threadInfo]);
	});
	printf("\n %s %s end",[self dateUTF8],[self threadInfo]);
}
-(void)muchQueueBuyTick{
	dispatch_queue_t queue= dispatch_queue_create("com.buy.tick", DISPATCH_QUEUE_CONCURRENT);
	dispatch_async(queue, ^{
		for (NSInteger i = 0; i < 5; i ++) {
			[self semaphore_buy_ticks:1];
		}
	});
	dispatch_queue_t queue2= dispatch_queue_create("com.buy2.tick", DISPATCH_QUEUE_CONCURRENT);
	dispatch_async(queue2, ^{
		for (NSInteger i = 0; i < 5; i ++) {
			[self semaphore_buy_ticks:1];
		}
	});
}
//使用串行队列卖票队列卖票
- (void)sync_buy_tick{
	
	static	dispatch_group_t group ;
	if (group == nil) {
		group = dispatch_group_create();
	}
	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//	dispatch_group_enter(group);
	dispatch_group_async(group, queue, ^{
		[self print];
		[NSThread sleepForTimeInterval:2];
//		dispatch_group_leave(group);//当注释掉  阻塞在wait不继续向下执行
	});
	dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
	
	dispatch_group_enter(group);
	dispatch_group_async(group, queue, ^{
		[self print];
		[NSThread sleepForTimeInterval:2];
		dispatch_group_leave(group);
	});
	
	
	
//	dispatch_async(dispatch_get_main_queue(), ^{
//		self.count--;
//		if (self.count > 0) {
//			printf("\n %s %s 第%ld个人买到票了",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,(long)self.count);
//			[NSThread sleepForTimeInterval:0.2];
//		}
//	});
}
//信号量为1 作为线程锁
- (void)semaphore_buy_ticks:(NSInteger)windowsCount{
	static dispatch_semaphore_t sem;
	if (sem == NULL) {
		sem = dispatch_semaphore_create(windowsCount);
	}
	//信号量-1
	dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
	self.count--;
	if (self.count > 0) {
		printf("\n %s %s 第%ld个人买到票了",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,(long)self.count);
		[NSThread sleepForTimeInterval:0.2];
	}
	//信号量+1
	dispatch_semaphore_signal(sem);
}
//信号量 当信号量为1 可以未做锁来用，当N>1，t通知执行的数量则是数字N。
- (void)semaphore{
	static dispatch_semaphore_t sem;
	if (sem == NULL) {
		sem = dispatch_semaphore_create(1);
	}
	dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
	static int i = 0;
	int currentI = i +2;
	for (; i < currentI; i ++) {
		[NSThread sleepForTimeInterval:1];
		printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
	}
	dispatch_semaphore_signal(sem);
}


-(void)asyn_semaphore{
	dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t idx) {
		[self exc_once];
	});
}
//延迟执行
-(void)delayTimeExc{
	printf("\n %s %s begin",[self dateUTF8],[self threadInfo]);
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		printf("\n %s %s",[self dateUTF8],[self threadInfo]);
	});
	printf("\n %s %s end",[self dateUTF8],[self threadInfo]);
}
//只执行一次的dispatch_once
-(void)exc_once{
	static dispatch_once_t onceToken;
	static NSObject *obj;
	dispatch_once(&onceToken, ^{
		obj=[NSObject new];
		printf("\n just once %s %s",[self dateUTF8],obj.description.UTF8String);
	});
	printf("\n %s %s",[self dateUTF8],obj.description.UTF8String);
}

- (void)barry{
	dispatch_queue_t queue= dispatch_queue_create("cust.queue.com", DISPATCH_QUEUE_CONCURRENT);
	dispatch_async(queue, ^{
		for (int i = 0; i < 3; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self dateUTF8],[self threadInfo],i);
		}
	});
	dispatch_barrier_sync(queue, ^{
		printf("\n %s %s ---中间暂停一下----",[self dateUTF8],[self threadInfo]);
	});
	dispatch_async(queue, ^{
		for (int i = 3; i < 6; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self dateUTF8],[self threadInfo],i);
		}
	});
	dispatch_barrier_async(queue, ^{
		printf("\n %s %s ---中间第二次暂停一下----",[self dateUTF8],[self threadInfo]);
	});
}
- (void)backToMain{
	dispatch_queue_t main = dispatch_get_main_queue();
	dispatch_queue_t glo = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	dispatch_async(glo, ^{
		for (int i = 0; i < 3; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self dateUTF8],[self threadInfo],i);
		}
		dispatch_sync(main, ^{
			printf("\n %s %s 我在刷新UI",[self dateUTF8],[self threadInfo]);
		});
	});
}
/*分组 当所有任务都执行完成 回调notif*/
-(void)group{
	dispatch_group_t group = dispatch_group_create();
	dispatch_queue_t queue= dispatch_queue_create("cust.queue.com", DISPATCH_QUEUE_CONCURRENT);
	dispatch_queue_t queue2= dispatch_queue_create("cust2.queue.com", DISPATCH_QUEUE_CONCURRENT);
	dispatch_group_async(group, queue, ^{
		for (int i = 0; i < 3; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self dateUTF8],[self threadInfo],i);
		}
	});
	dispatch_group_async(group, queue2, ^{
		for (int i = 4; i < 6; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self dateUTF8],[self threadInfo],i);
		}
	});
	dispatch_group_notify(group, dispatch_get_main_queue(), ^{
		printf("\n %s %s ---end1----",[self dateUTF8],[self threadInfo]);
	});
	dispatch_group_async(group, queue, ^{
		for (int i = 6; i < 8; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self dateUTF8],[self threadInfo],i);
		}
	});
	dispatch_group_async(group, queue2, ^{
		for (int i = 8; i < 10; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self dateUTF8],[self threadInfo],i);
		}
	});
}
//主队列+同步 死锁
-(void)sync_main{
	NSLog(@"1");
	dispatch_queue_t main_queue = dispatch_get_main_queue();
	dispatch_sync(main_queue, ^{
		NSLog(@"2");
	});
	NSLog(@"3");
}
//主队列+同步
-(void)sync_main2{
	NSLog(@"1任务执行");
	sleep(1);
	NSLog(@"2任务执行");
	sleep(1);
	NSLog(@"3任务执行");
}
//主队列+异步
-(void)async_main{
	NSLog(@"start");
	dispatch_queue_t main_queue = dispatch_get_main_queue();
	dispatch_async(main_queue, ^{
		for (int i = 0; i < 3; i ++) {
			[NSThread sleepForTimeInterval:1];
			NSLog(@"%@ %d",[NSThread currentThread],i);
		}
	});
	dispatch_async(main_queue, ^{
		for (int i = 3; i < 6; i ++) {
			[NSThread sleepForTimeInterval:1];
			NSLog(@"%@ %d",[NSThread currentThread],i);
		}
	});
	dispatch_async(main_queue, ^{
		for (int i = 7; i < 10; i ++) {
			[NSThread sleepForTimeInterval:1];
			NSLog(@"%@ %d",[NSThread currentThread],i);
		}
	});
	NSLog(@"end");
}
//全局队列+同步
-(void)sync_global{
	printf("\n start");
	dispatch_queue_t global_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	dispatch_sync(global_queue, ^{
		for (int i = 0; i < 3; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_sync(global_queue, ^{
		for (int i = 3; i < 6; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_sync(global_queue, ^{
		NSThread *thread = [NSThread currentThread];
		for (int i = 7; i < 10; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,thread.description.UTF8String,i);
		}
	});
	printf("\n end");
}
//全局队列+异步
-(void)async_global{
	printf("\n start");
	dispatch_queue_t global_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	dispatch_async(global_queue, ^{
		for (int i = 0; i < 3; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_async(global_queue, ^{
		for (int i = 3; i < 6; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_async(global_queue, ^{
		NSThread *thread = [NSThread currentThread];
		for (int i = 7; i < 10; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,thread.description.UTF8String,i);
		}
	});
	printf("\n end");
}
//创建串行队列+同步
-(void)sync_cust_queue{
	printf("\n start");
	dispatch_queue_t custQueue = dispatch_queue_create("cust-queue", DISPATCH_QUEUE_SERIAL);
	dispatch_sync(custQueue, ^{
		for (int i = 0; i < 3; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_sync(custQueue, ^{
		for (int i = 3; i < 6; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_sync(custQueue, ^{
		NSThread *thread = [NSThread currentThread];
		for (int i = 7; i < 10; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,thread.description.UTF8String,i);
		}
	});
	printf("\n end");
}
-(NSString *)currentDateString{
	NSDate *date=[NSDate new];
	NSDateFormatter *format = [[NSDateFormatter alloc]init];
	[format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	return [format stringFromDate:date];
}
-(const char *)dateUTF8{
	return [self currentDateString].UTF8String;
}
//创建串行队列+异步
-(void)async_cust_queue{
	printf("\n start");
	dispatch_queue_t custQueue = dispatch_queue_create("cust-queue", DISPATCH_QUEUE_SERIAL);
	dispatch_async(custQueue, ^{
		for (int i = 0; i < 3; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_async(custQueue, ^{
		for (int i = 3; i < 6; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_async(custQueue, ^{
		NSThread *thread = [NSThread currentThread];
		for (int i = 7; i < 10; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,thread.description.UTF8String,i);
		}
	});
	printf("\n end");
}
//创建并行队列+异步
-(void)async_queue{
	printf("\n start");
	dispatch_queue_t custQueue = dispatch_queue_create("cust-queue", DISPATCH_QUEUE_CONCURRENT);
	dispatch_async(custQueue, ^{
		for (int i = 0; i < 3; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_async(custQueue, ^{
		for (int i = 3; i < 6; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_async(custQueue, ^{
		NSThread *thread = [NSThread currentThread];
		for (int i = 7; i < 10; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,thread.description.UTF8String,i);
		}
	});
	printf("\n end");
}
//创建并行队列+同步
-(void)sync_queue{
	printf("\n start");
	dispatch_queue_t custQueue = dispatch_queue_create("cust-queue", DISPATCH_QUEUE_CONCURRENT);
	dispatch_sync(custQueue, ^{
		for (int i = 0; i < 3; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_sync(custQueue, ^{
		for (int i = 3; i < 6; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,[NSThread currentThread].description.UTF8String,i);
		}
	});
	dispatch_sync(custQueue, ^{
		NSThread *thread = [NSThread currentThread];
		for (int i = 7; i < 10; i ++) {
			[NSThread sleepForTimeInterval:1];
			printf("\n %s %s %d",[self currentDateString].UTF8String,thread.description.UTF8String,i);
		}
	});
	printf("\n end");
}
-(const char *)threadInfo{
	return [NSThread currentThread].description.UTF8String;
}
@end
