//
//  CreateShape.h
//  test
//
//  Created by Charlie on 2019/5/20.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@protocol Shape <NSObject>

- (void)draw;

@end


@interface Square : NSObject <Shape>
- (void)draw;
@end

@interface Circle : NSObject <Shape>
- (void)draw;
@end




@protocol Color <NSObject>

- (void)fill;

@end

@interface Red : NSObject <Color>
- (void)fill;
@end

@interface Green : NSObject <Color>
- (void)fill;
@end

@interface Blue : NSObject <Color>
- (void)fill;
@end

@interface CreateShape : NSObject
+ (id) getShape:(NSString *) name;
@end


@interface AbstractFactory :NSObject
- (id)getColor:(NSString *)colorName;
- (id)getShape:(NSString *)shapeName;
@end
@interface ColorFactory : AbstractFactory
- (id)getColor:(NSString *)colorName;
- (id)getShape:(NSString *)shapeName;

@end

@interface ShapeFactory : AbstractFactory
- (id)getColor:(NSString *)colorName;
- (id)getShape:(NSString *)shapeName;
@end

@interface  FactoryProducer : NSObject
- (id)getFactory:(NSString *)factoryName;

@end
NS_ASSUME_NONNULL_END
