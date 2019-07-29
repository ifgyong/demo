//
//  FYPthread_mutex.h
//  day16--线程安全
//
//  Created by Charlie on 2019/7/26.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYBaseDemo.h"
#import <pthread.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYPthread_mutex : FYBaseDemo
@property (nonatomic,assign) pthread_mutex_t plock;
@end

NS_ASSUME_NONNULL_END
