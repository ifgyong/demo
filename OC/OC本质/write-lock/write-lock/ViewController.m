//
//  ViewController.m
//  write-lock
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()
@property (nonatomic,strong) dispatch_semaphore_t semaphore;
@property (nonatomic,assign) pthread_rwlock_t rwlock;
@property (nonatomic,strong) dispatch_queue_t rwqueue;

@end

@implementation ViewController
- (void)dealloc{
	pthread_rwlock_destroy(&_rwlock);//销毁锁
}
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.semaphore = dispatch_semaphore_create(1);
//初始化读写锁
	pthread_rwlock_init(&_rwlock, NULL);
	
//	for (NSInteger i = 0; i < 10; i ++) {
//		[[[NSThread alloc]initWithTarget:self selector:@selector(readPthreadRWLock) object:nil]start];
//		[[[NSThread alloc]initWithTarget:self selector:@selector(writePthreadRWLock) object:nil]start];
//	}
	self.rwqueue = dispatch_queue_create("rw.thread", DISPATCH_QUEUE_CONCURRENT);
	
	dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
	for (NSInteger i = 0; i < 5; i ++) {
		dispatch_async(queue, ^{
//			[[[NSThread alloc]initWithTarget:self selector:@selector(readBarryier) object:nil]start];
//			[[[NSThread alloc]initWithTarget:self selector:@selector(writeBarrier) object:nil]start];
			[self readBarryier];
			[self readBarryier];
			[self readBarryier];
			[self writeBarrier];
		});
	}
}

- (void)readSemaphore{
	dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
	NSLog(@"读文件");
	sleep(1);
	dispatch_semaphore_signal(self.semaphore);
}
- (void)writeSemaphore{
	dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
	NSLog(@"%s 写文件",__func__);
	sleep(1);
	dispatch_semaphore_signal(self.semaphore);
}

- (void)readPthreadRWLock{
	pthread_rwlock_rdlock(&_rwlock);
	NSLog(@"读文件");
	sleep(1);
	pthread_rwlock_unlock(&_rwlock);
}
- (void)writePthreadRWLock{
	pthread_rwlock_wrlock(&_rwlock);
	NSLog(@" 写入文件");
	sleep(1);
	pthread_rwlock_unlock(&_rwlock);
}

- (void)readBarryier{
	dispatch_async(self.rwqueue, ^{
		NSLog(@"读文件 %@",[NSThread currentThread]);
		sleep(1);
	});
}
- (void)writeBarrier{
	dispatch_barrier_async(self.rwqueue, ^{
		NSLog(@"写入文件 %@",[NSThread currentThread]);
		sleep(1);
	});
}
@end
