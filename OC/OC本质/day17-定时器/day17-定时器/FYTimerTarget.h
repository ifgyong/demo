//
//  FYTimerTarget.h
//  day17-定时器
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYTimerTarget : NSObject
+ (instancetype)proxyWithTarget:(id)obj;
@property (nonatomic,weak) id target;
@end

NS_ASSUME_NONNULL_END
