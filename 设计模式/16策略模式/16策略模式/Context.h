//
//  Context.h
//  16策略模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface Strategy : NSObject
- (void)handle;
@end
@interface StrategyA : NSObject
- (void)handle;
@end
@interface StrategyB : NSObject
- (void)handle;
@end

@interface Context : NSObject
@property (nonatomic,strong) Strategy *obj;
- (void)opertion;
@end

NS_ASSUME_NONNULL_END
