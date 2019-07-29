//
//  OSSPinLockDemo2.h
//  day16-线程安全
//
//  Created by fgy on 2019/7/25.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYBaseDemo.h"
#import <libkern/OSAtomic.h>
NS_ASSUME_NONNULL_BEGIN

@interface OSSPinLockDemo2 : FYBaseDemo
@property (nonatomic,assign) OSSpinLock *moneyLock;
@property (nonatomic,assign) OSSpinLock *ticketLock;
@end

NS_ASSUME_NONNULL_END
