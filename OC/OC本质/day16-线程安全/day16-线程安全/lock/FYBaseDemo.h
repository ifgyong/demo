//
//  FYBaseDemo.h
//  day16-线程安全
//
//  Created by fgy on 2019/7/25.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYBaseDemo : NSObject
@property (nonatomic,assign) NSInteger ticketsCount;
@property (nonatomic,assign) NSInteger money;


- (void)__saleTicket;
- (void)__getMonery;
- (void)__saveMonery;

- (void)ticketTest;
- (void)moneyTest;
@end

NS_ASSUME_NONNULL_END
