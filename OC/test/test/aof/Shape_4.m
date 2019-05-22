//
//  Shape_4.m
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Shape_4.h"

@implementation Shape_4

@end
@implementation Rectangle_4
- (void)draw{
    NSLog(@"Rectangle_4 draw");
}
@end
@implementation Cirle_4
- (void)draw{
    NSLog(@"Circle_4 draw");
}
@end
@implementation Shape_4_Maker

+ (instancetype)initWithCircle:(id<Shape4Protocl>)circle rectang:(id<Shape4Protocl>)rectang{
    Shape_4_Maker *maker=[[Shape_4_Maker alloc]init];
    maker.circle = circle;
    maker.rectangle = rectang;
    return maker;
}
- (void)drawCircle{
    if ([self.circle conformsToProtocol:@protocol(Shape4Protocl)] ) {
        [self.circle performSelector:@selector(draw)];
    }
}
- (void)drawRectang{
    if ([self.rectangle conformsToProtocol:@protocol(Shape4Protocl)] ) {
        [self.rectangle performSelector:@selector(draw)];
    }
}
@end
