//
//  FYAumoic.h
//  day16--线程安全
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYBaseDemo.h"

NS_ASSUME_NONNULL_BEGIN

@interface FYAumoic : FYBaseDemo
@property (atomic,assign) int count;
/**
 atomic :原子性
 nonatomic：非原子性
 给属性添加 atomic修饰，可以保证属性的setter和getter方法是原子操作。
 给属性添加 nonatomic修饰，
 */
@end

NS_ASSUME_NONNULL_END
