//
//  FYTimer.m
//  day17-定时器2
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYTimer.h"

@implementation FYTimer
static int i = 0;
static NSMutableDictionary *timers;
dispatch_semaphore_t samephore;
+(void)initialize{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		timers =[NSMutableDictionary dictionary];
		samephore = dispatch_semaphore_create(1);
	});
}
+ (NSString *)exeTask:(dispatch_block_t)block start:(NSTimeInterval)time interval:(NSTimeInterval)interval repeat:(BOOL)repeat async:(BOOL)async{
	if (block == nil) {
		return nil;
	}
	if (repeat && interval <= 0) {
		return nil;
	}
	
	NSString *name =[NSString stringWithFormat:@"%d",i];
	//主队列
	dispatch_queue_t queue = dispatch_get_main_queue();
	if (async) {
		queue = dispatch_queue_create("async.com", DISPATCH_QUEUE_CONCURRENT);
	}
	//创建定时器
	dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
	//设置启动时间
	dispatch_source_set_timer(_timer,
							  dispatch_time(DISPATCH_TIME_NOW, time*NSEC_PER_SEC), interval*NSEC_PER_SEC, 0);
	//设定回调
	dispatch_source_set_event_handler(_timer, ^{
		block();
		if (repeat == NO) {
			dispatch_source_cancel(_timer);
		}
	});
	//启动定时器
	dispatch_resume(_timer);
	//存放到字典
	if (name.length && _timer) {
		dispatch_semaphore_wait(samephore, DISPATCH_TIME_FOREVER);
		timers[name] = _timer;
		dispatch_semaphore_signal(samephore);
	}
	return name;
}
+ (NSString *)exeTask:(id)target
				  sel:(SEL)aciton
				start:(NSTimeInterval)time
			 interval:(NSTimeInterval)interval
			   repeat:(BOOL)repeat
				async:(BOOL)async{
	if (target == nil || aciton == NULL) {
		return nil;
	}
	if (repeat && interval <= 0) {
		return nil;
	}
	
	NSString *name =[NSString stringWithFormat:@"%d",i];
	//主队列
	dispatch_queue_t queue = dispatch_get_main_queue();
	if (async) {
		queue = dispatch_queue_create("async.com", DISPATCH_QUEUE_CONCURRENT);
	}
	//创建定时器
	dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
	//设置启动时间
	dispatch_source_set_timer(_timer,
							  dispatch_time(DISPATCH_TIME_NOW, time*NSEC_PER_SEC), interval*NSEC_PER_SEC, 0);
	//设定回调
	dispatch_source_set_event_handler(_timer, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
		//这里是会报警告的代码
		if ([target respondsToSelector:aciton]) {
			[target performSelector:aciton];
		}
#pragma clang diagnostic pop

		if (repeat == NO) {
			dispatch_source_cancel(_timer);
		}
	});
	//启动定时器
	dispatch_resume(_timer);
	//存放到字典
	if (name.length && _timer) {
		dispatch_semaphore_wait(samephore, DISPATCH_TIME_FOREVER);
		timers[name] = _timer;
		dispatch_semaphore_signal(samephore);
	}
	return name;
}
+ (void)exeCancelTask:(NSString *)key{
	if (key.length == 0) {
		return;
	}
	dispatch_semaphore_wait(samephore, DISPATCH_TIME_FOREVER);
	if ([timers.allKeys containsObject:key]) {
		dispatch_source_cancel(timers[key]);
		[timers removeObjectForKey:key];
	}
	dispatch_semaphore_signal(samephore);
}
@end
