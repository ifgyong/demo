//
//  OSSPinLockDemo2.m
//  day16-线程安全
//
//  Created by fgy on 2019/7/25.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "OSSPinLockDemo2.h"

@implementation OSSPinLockDemo2
- (instancetype)init{
    if (self =[super init]) {
        self.moneyLock = OS_SPINLOCK_INIT;
        self.ticketLock = OS_SPINLOCK_INIT;
//		//锁的初始化
//		OSSpinLock lock = OS_SPINLOCK_INIT;
//		//尝试加锁 加锁失败会直接向下执行
//		bool ret = OSSpinLockTry(&lock);
//		//加锁
//		OSSpinLockLock(&lock);
//		//解锁
//		OSSpinLockUnlock(&lock);
    }
    return self;
}
- (void)__getMonery{
    OSSpinLockLock(&_moneyLock);
    [super __getMonery];
    OSSpinLockUnlock(&_moneyLock);
}
- (void)__saleTicket{
    OSSpinLockLock(&_moneyLock);
    [super __saleTicket];
    OSSpinLockUnlock(&_moneyLock);
}
- (void)__saveMonery{
    OSSpinLockLock(&_moneyLock);
    [super __saveMonery];
    OSSpinLockUnlock(&_moneyLock);
}
@end
