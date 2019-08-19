//
//  StateClass.h
//  15状态模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
	StateClose = 0,
	StateOpen = 1,
} State;
@interface StateClass : NSObject

@property (nonatomic,assign) State s;
@end

NS_ASSUME_NONNULL_END
