//
//  FYState.m
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYState.h"

@implementation FYState

@end
@implementation StartState

- (void)doAction:(Context *)obj{
    NSLog(@"player is in start state");
    obj.state = self;
}
- (NSString *)toString{
    return @"start state";
}
@end
@implementation StopState

- (void)doAction:(Context *)obj{
    obj.state = self;
    NSLog(@"player is in stop state");
}
- (NSString *)toString{
    return @"stop state";
}
@end
@implementation Context

- (NSString *)toString{
    return @"";
}

@end
