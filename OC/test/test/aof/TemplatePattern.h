//
//  TemplatePattern.h
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface Game : NSObject
- (void)initialize;
- (void)startPlay;
- (void)endPlay;
- (void)play;
@end
@interface Football : Game


@end
@interface PingPangBall : Game

@end

@interface TemplatePattern : NSObject
@end

NS_ASSUME_NONNULL_END
