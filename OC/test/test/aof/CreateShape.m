//
//  CreateShape.m
//  test
//
//  Created by Charlie on 2019/5/20.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "CreateShape.h"

@implementation CreateShape
+ (id)getShape:(NSString *)name{
    if ([name isEqualToString:NSStringFromClass(Square.class)]) {
        return Square.new;
    }else if ([name isEqualToString:NSStringFromClass(Circle.class)]){
        return Circle.new;
    }
    return nil;
}
@end
@implementation Square

- (void)draw{
    NSLog(@"inside Square draw method ");
}

@end
@implementation Circle
- (void)draw {
    NSLog(@"inside Circle draw method ");
}
@end

@implementation Red
- (void)fill{
    NSLog(@"inside Red fill method ");
}
@end

@implementation Green
- (void)fill{
    NSLog(@"inside Green fill method ");
}
@end


@implementation Blue
- (void)fill{
    NSLog(@"inside Blue fill method ");
}
@end

@implementation AbstractFactory
-(id)getShape:(NSString *)shapeName{
    return nil;
}
- (id)getColor:(NSString *)colorName{
    return nil;
}
@end
@implementation ColorFactory

- (id)getColor:(NSString *)colorName{
    if ([colorName isEqualToString:NSStringFromClass(Red.class)]) {
        return Red.new;
    }else if ([colorName isEqualToString:NSStringFromClass(Green.class)]) {
        return Green.new;
    }else if ([colorName isEqualToString:NSStringFromClass(Blue.class)]) {
        return Blue.new;
    }
    return nil;
}
- (id)getShape:(NSString *)shapeName{
    return nil;
}
@end

@implementation ShapeFactory

- (id)getColor:(NSString *)colorName{
    return nil;
}
- (id)getShape:(NSString *)shapeName{
    if ([shapeName isEqualToString:NSStringFromClass(Square.class)]) {
        return Square.new;
    }else if ([shapeName isEqualToString:NSStringFromClass(Circle.class)]){
        return Circle.new;
    }
    return nil;
}
@end

@implementation FactoryProducer

-(id)getFactory:(NSString *)factoryName{
    if ([factoryName isEqualToString:NSStringFromClass(ColorFactory.class)]) {
        return ColorFactory.new;
    }else if ([factoryName isEqualToString:NSStringFromClass(ShapeFactory.class)]){
        return ShapeFactory.new;
    }
    return nil;
}
@end
