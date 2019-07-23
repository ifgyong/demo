//
//  FYPermenantThread.h
//  CFRunloop
//
//  Created by fgy on 2019/7/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYPermenantThread : NSObject

/**
 开始一个线程
 */
- (void)run;

/**
 结束
 */
- (void)stop;
- (void)exceTaskWithTarget:(id)target action:(SEL)action obj:(id)obj;
- (void)exceTaskWithBlock:(dispatch_block_t)block;

@end

NS_ASSUME_NONNULL_END
