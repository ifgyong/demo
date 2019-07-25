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
        self.moneyLock = 0;
        self.ticketLock = OS_SPINLOCK_INIT;
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
