//
//  FYOSUnfairLockDemo.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/26.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYOSUnfairLockDemo.h"
@interface FYOSUnfairLockDemo(){
	os_unfair_lock _unlock;
}
@end

@implementation FYOSUnfairLockDemo
- (instancetype)init{
	if (self = [super init]) {
		_unlock = OS_UNFAIR_LOCK_INIT;
	}
	return self;
}
- (void)__saveMonery{
	os_unfair_lock_lock(&_unlock);
	[super __saveMonery];
	os_unfair_lock_unlock(&_unlock);
}
- (void)__getMonery{
	os_unfair_lock_lock(&_unlock);
	[super __getMonery];
	os_unfair_lock_unlock(&_unlock);
}
- (void)__saleTicket{
 	os_unfair_lock_lock(&_unlock);
	[super __saleTicket];
	os_unfair_lock_unlock(&_unlock);
}
@end
