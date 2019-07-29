//
//  FYPthread_mutex.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/26.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPthread_mutex.h"
@interface FYPthread_mutex(){
	pthread_mutexattr_t t;
}
@end
@implementation FYPthread_mutex
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
@end
