//
//  Flyweight.h
//  10享元模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FlyweightProtocol <NSObject>

- (void)play;
@end

@interface FlyweightA : NSObject<FlyweightProtocol>
- (void)eat;
@end
@interface FlyweightB : NSObject<FlyweightProtocol>
- (void)run;
@end
NS_ASSUME_NONNULL_END
