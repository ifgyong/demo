//
//  SimpleFactory.m
//  01工厂模式
//
//  Created by fgy on 2019/8/13.
//  Copyright © 2019 test. All rights reserved.
//

#import "SimpleFactory.h"
@class ProductA1,ProductA2,ProductB1,ProductB2,Factory1,Factory2;

@implementation Factory1

+ (nonnull id<ProductA>)createProductA:(nonnull NSString *)FactoryName {
	if ([FactoryName isEqualToString:NSStringFromClass(ProductA1.class)]) {
		return [[ProductA1 alloc]init];
	}else if ([FactoryName isEqualToString:NSStringFromClass(ProductA2.class)]) {
		return [[ProductA2 alloc]init];
	}else{
		return nil;
	}
}

+ (nonnull id<ProductB>)createProductB:(nonnull NSString *)FactoryName {
	if ([FactoryName isEqualToString:NSStringFromClass(ProductB1.class)]) {
		return [[ProductB1 alloc]init];
	}else if ([FactoryName isEqualToString:NSStringFromClass(ProductB2.class)]) {
		return [[ProductB2 alloc]init];
	}else{
		return nil;
	}
}

@end
@implementation Factory2

+ (nonnull id<ProductA>)createProductA:(nonnull NSString *)FactoryName {
	if ([FactoryName isEqualToString:NSStringFromClass(ProductA1.class)]) {
		return [[ProductA1 alloc]init];
	}else if ([FactoryName isEqualToString:NSStringFromClass(ProductA2.class)]) {
		return [[ProductA2 alloc]init];
	}else{
		return nil;
	}
}

+ (nonnull id<ProductB>)createProductB:(nonnull NSString *)FactoryName {
	if ([FactoryName isEqualToString:NSStringFromClass(ProductB1.class)]) {
		return [[ProductB1 alloc]init];
	}else if ([FactoryName isEqualToString:NSStringFromClass(ProductB2.class)]) {
		return [[ProductB2 alloc]init];
	}else{
		return nil;
	}
}

@end




@implementation ProductA1
- (void)productMethod {
}
@end
@implementation ProductA2
- (void)productMethod {
}
@end
@implementation ProductB1
- (void)productMethod {
    
}
@end
@implementation ProductB2
- (void)productMethod {
	
}
@end
