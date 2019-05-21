//
//  Copy_item.m
//  test
//
//  Created by Charlie on 2019/5/20.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Copy_item.h"
@implementation Copy_item

@end
@implementation ShapeCopy
- (instancetype)copy
{//实现深拷贝
    ShapeCopy *c =[[ShapeCopy alloc]init];
    c.name = self.name;
    c.age = self.age;
    return c;
}
@end
@implementation RectangleCopy
- (instancetype)copy
{
    RectangleCopy *c =[[RectangleCopy alloc]init];
    c.name = self.name;
    c.age = self.age;
    return c;
}
-(NSString *)name{
    return @"RectangleCopy";
}
- (void)draw{
    NSLog(@"inside RectangleCopy draw method");
}
@end

@implementation SquareCopy
- (instancetype)copy
{
    SquareCopy *c =[[SquareCopy alloc]init];
    c.name = self.name;
    c.age = self.age;
    return c;
}
-(NSString *)name{
    return @"SquareCopy";
}
- (void)draw{
    NSLog(@"inside SquareCopy draw method");
}
@end

@implementation ShapeCache
- (NSMutableDictionary *)dic{
    if (_dic == nil) {
        _dic =[NSMutableDictionary dictionary];
    }
    return _dic;
}
- (void)loadCache{
    SquareCopy *sq=[SquareCopy new];
    [self.dic setObject:sq forKey:@"1"];
    
    RectangleCopy *re =[RectangleCopy new];
    [self.dic setObject:re forKey:@"2"];
}
- (ShapeCopy *)getShape:(NSString *)name{
    if ([self.dic.allKeys containsObject:name]) {
        return [[self.dic objectForKey:name] copy];
    }
    return nil;
}

@end
