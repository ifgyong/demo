//
//  Order.h
//  12命令模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Order : NSObject
- (void)exe;
@end

@protocol CommandProtocol <NSObject>

- (void)play;

@end

@interface Order1 : NSObject<CommandProtocol>

@end
@interface Order2 : NSObject<CommandProtocol>

@end
@interface Order3 : NSObject<CommandProtocol>

@end
NS_ASSUME_NONNULL_END
