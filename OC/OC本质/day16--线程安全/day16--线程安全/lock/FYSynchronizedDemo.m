//
//  FYSynchronizedDemo.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYSynchronizedDemo.h"

@interface FYSynchronizedDemo(){
}
@end
@implementation FYSynchronizedDemo

- (instancetype)init{
	if (self =[super init]) {
	}
	return self;
}
- (void)__saleTicket{
	//锁的是self对象锁
	@synchronized (self) {
		[super __saleTicket];
	}
 }
- (void)__getMonery{
	@synchronized (self) {
		[super __getMonery];
	}
 }
- (void)__saveMonery{
	@synchronized (self) {
		[super __saveMonery];
	}
 }
@end
