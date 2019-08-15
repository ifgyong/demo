//
//  SimpleFactory.h
//  01工厂模式
//
//  Created by fgy on 2019/8/13.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// productMethod 产品的方法
@protocol ProductA <NSObject>
-(void)productMethod;
@end
@protocol ProductB <NSObject>
-(void)productMethod;
@end
//工厂抽象方法
@protocol Factory <NSObject>
+ (id<ProductA>)createProductA:(NSString *)FactoryName;
+ (id<ProductB>)createProductB:(NSString *)FactoryName;

@end

//工厂类A
@interface Factory1 : NSObject<Factory>

@end
//工厂类B
@interface Factory2 : NSObject<Factory>

@end

//产品A 实现协议代替 抽象方法
@interface ProductA1 : NSObject<ProductA>
@end
@interface ProductA2 : NSObject<ProductA>
@end
//产品B 实现协议代替 抽象方法
@interface ProductB1 : NSObject<ProductB>
@end
@interface ProductB2 : NSObject<ProductB>
@end
NS_ASSUME_NONNULL_END
