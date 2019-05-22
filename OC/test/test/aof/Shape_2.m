//
//  Shape_2.m
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Shape_2.h"




@implementation Rectangle_3
- (void)draw{
    NSLog(@"Rectangle_2 draw");
}
@end
@implementation Circle_3
- (void)draw{
    NSLog(@"circle_2 draw");
}
@end
@implementation ShapeDecorator
+ (instancetype)initWith:(id)obj{
    ShapeDecorator * sd =[ShapeDecorator alloc];
    if ([obj conformsToProtocol:@protocol(ShapeProtocol)]) {
        sd.obj = obj;
    }
    return sd;
}
- (void)draw
{
    if ([self.obj conformsToProtocol:@protocol(ShapeProtocol)]) {
        [self.obj performSelector:@selector(draw)];
    }
}
@end

@implementation Shape_3
-(void)draw{
    if ([self.obj conformsToProtocol:@protocol(ShapeProtocol)]) {
        [self.obj performSelector:@selector(draw)];
    }
    [self setRedBorder];
}
- (void)setRedBorder{
    NSLog(@"setRedBorder");
}
@end
