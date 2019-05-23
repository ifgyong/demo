//
//  TemplatePattern.m
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "TemplatePattern.h"

@implementation TemplatePattern

@end
@implementation Game
- (void)initialize{}
- (void)startPlay{}
- (void)endPlay{}
- (void)play{
    [self initialize];
    [self startPlay];
    [self endPlay];
}

@end

@implementation Football

- (void)endPlay{
    NSLog(@" football game finish");
}

- (void)startPlay{
    NSLog(@" football game start");
}
@end
@implementation PingPangBall

- (void)endPlay{
    NSLog(@" PingPangBall game finish");
}
- (void)startPlay{
    NSLog(@" PingPangBall game start");
}
@end
