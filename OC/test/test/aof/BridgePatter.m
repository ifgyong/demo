//
//  BridgePatter.m
//  test
//
//  Created by Charlie on 2019/5/21.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "BridgePatter.h"

@implementation BridgePatter

@end
@implementation DrawAPI

- (void)drawCircle:(int)radius x:(int)x y:(int)y
{
    NSLog(@"DrawAPI radius=%dx=%d y=%d",radius,x,y);
}
@end
@implementation RedCircle

- (void)drawCircle:(int)radius x:(int)x y:(int)y
{
    NSLog(@"RedCircle radius=%dx=%d y=%d",radius,x,y);
}
@end


@implementation GreenCircle
- (void)drawCircle:(int)radius x:(int)x y:(int)y
{
    NSLog(@"GreenCircle radius=%dx=%d y=%d",radius,x,y);
}
@end

@implementation Shape

- (void)Shape:(DrawAPI *)api{
    self.api = api;
}
- (void)draw{}

@end

@implementation Circle_2

+ (instancetype)configWithRadius:(int)radius x:(int)x y:(int)y draw:(DrawAPI *)api{
    Circle_2 *clr = [Circle_2 new];
    clr.x = x;
    clr.y = y;
    clr.radius = radius;
    clr.api = api;
    return clr;
}
- (void)draw{
    [self.api drawCircle:self.radius
                       x:self.x
                       y:self.y];
}

@end

