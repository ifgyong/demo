//
//  FYSerialQueueDemo.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYSerialQueueDemo.h"
@interface FYSerialQueueDemo(){
	dispatch_queue_t _queue;
}@end
@implementation FYSerialQueueDemo
- (instancetype)init{
	if (self =[super init]) {
		_queue = dispatch_queue_create("fyserial.queue", DISPATCH_QUEUE_SERIAL);
	}
	return self;
}
- (void)__saleTicket{
	dispatch_sync(_queue, ^{
		[super __saleTicket];
	});
}
- (void)__getMonery{
	dispatch_sync(_queue, ^{
		[super __getMonery];
	});
}
- (void)__saveMonery{
	dispatch_sync(_queue, ^{
		[super __saveMonery];
	});
}
@end
