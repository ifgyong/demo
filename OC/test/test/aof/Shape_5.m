//
//  Shape_5.m
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Shape_5.h"

@implementation Shape_5

@end
@implementation Circle_5

- (void)draw{
    NSLog(@"%@",self.description);
}
- (NSString *)description{
    return [NSString stringWithFormat:@"Circle_5 color:%@ x:%d y:%d radius:%d",_color,_x,_y,_radius];
}
@end
@implementation Shape_5_Factory

- (NSMutableDictionary *)info{
    if (_info == nil) {
        _info=[NSMutableDictionary dictionary];
    }
    return _info;
}


- (id<Shape5Protocol>)getShape:(NSString *)color{
    if ([self.info.allKeys containsObject:color]) {
        return self.info[color];
    }else if(color.length){
        Circle_5 *shape=[[Circle_5 alloc]init];
        shape.color = color;
        [self.info setObject:shape forKey:color];
        NSLog(@"creating circle of color:%@",color);
        return shape;
    }
    return nil;
}
@end
