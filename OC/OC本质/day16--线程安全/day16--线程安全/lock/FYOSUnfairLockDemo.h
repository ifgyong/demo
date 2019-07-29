//
//  FYOSUnfairLockDemo.h
//  day16--线程安全
//
//  Created by Charlie on 2019/7/26.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYBaseDemo.h"
#import <os/lock.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYOSUnfairLockDemo : FYBaseDemo
@property (nonatomic,assign) os_unfair_lock unfairLock;
@end

NS_ASSUME_NONNULL_END
