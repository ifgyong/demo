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
@protocol Product <NSObject>
-(void)productMethod;
@end
//工厂抽象方法
@protocol Factory <NSObject>
+ (void)createProduct:(NSString *)productName;
@end

//工厂类A
@interface FactoryA : NSObject<Factory>
+(id<Product>)createProduct:(NSString *)productName;
@end
//工厂类B
@interface FactoryB : NSObject<Factory>
+(id<Product>)createProduct:(NSString *)productName;
@end

//产品A 实现协议代替 抽象方法
@interface ProductA : NSObject<Product>

@end
//产品B 实现协议代替 抽象方法
@interface ProductB : NSObject<Product>

@end

NS_ASSUME_NONNULL_END
