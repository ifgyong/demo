//
//  FYNSLock.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYNSLock.h"
@interface FYNSLock(){
	NSLock *_lock;
}
@end

@implementation FYNSLock
- (instancetype)init{
	if (self = [super init]) {
		//封装了mutex的普通锁
		_lock=[[NSLock alloc]init];
	}
	return self;
}

- (void)__saveMonery{
	[_lock lock];
	[super __saveMonery];
	[_lock unlock];
}
- (void)__saleTicket{
	[_lock lock];
	[super __saleTicket];
	[_lock unlock];
}
- (void)__getMonery{
	[_lock lock];
	[super __getMonery];
	[_lock unlock];
}
@end
