//
//  FYPthread_Mutex3.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/26.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPthread_Mutex3.h"
@interface FYPthread_Mutex3(){
	pthread_mutexattr_t t;
	pthread_cond_t _cond;

}
@property (nonatomic,strong) NSMutableArray *array;
@end
@implementation FYPthread_Mutex3
-(void)dealloc{
	pthread_mutex_destroy(&_plock);
	pthread_mutexattr_destroy(&t);
}
-(instancetype)init{
	if (self =[super init]) {
		//初始化锁的属性
		//		pthread_mutexattr_init(&t);
		pthread_mutexattr_settype(&t, PTHREAD_MUTEX_NORMAL);
		//		//初始化锁
		//		pthread_mutex_init(&_plock, &t);
		
		pthread_mutex_t plock = PTHREAD_MUTEX_INITIALIZER;
		self.plock = plock;
		pthread_mutex_t plock2 = PTHREAD_MUTEX_INITIALIZER;
		self.plock2 = plock2;
		self.array =[NSMutableArray array];
		//条件初始化
		pthread_cond_init(&_cond, NULL);
		
	}
	return self;
}
-(void)__saleTicket{
	pthread_mutex_lock(&_plock);
	[super __saleTicket];
	pthread_mutex_unlock(&_plock);
}
- (void)__getMonery{
	pthread_mutex_lock(&_plock);
	[super __getMonery];
	pthread_mutex_unlock(&_plock);
}
- (void)__saveMonery{
	pthread_mutex_lock(&_plock);
	[super __saveMonery];
	pthread_mutex_unlock(&_plock);
}
- (void)otherTest{
//	pthread_mutex_lock(&_plock);
	NSLog(@"%s",__func__);
	[[[NSThread alloc]initWithTarget:self selector:@selector(__remove) object:nil] start];
	[[[NSThread alloc]initWithTarget:self selector:@selector(__add) object:nil] start];
//	pthread_mutex_unlock(&_plock);
}
- (void)otherTest2{
	pthread_mutex_lock(&_plock2);
	NSLog(@"%s",__func__);
	pthread_mutex_unlock(&_plock2);
}
- (void)__add{
	pthread_mutex_lock(&_plock);
	[self.array addObject:@"Test"];
	//唤醒条件锁  需要执行条件
	pthread_cond_signal(&_cond);//激活一个线程
//	pthread_cond_broadcast(&_cond);//激活所有等待该条件的线程
	pthread_mutex_unlock(&_plock);
}
- (void)__remove{
	pthread_mutex_lock(&_plock);
	if(self.array.count == 0){
		//睡觉 等待条件
		pthread_cond_wait(&_cond, &_plock);
	}
	[self.array removeLastObject];
	pthread_mutex_unlock(&_plock);
}

@end
