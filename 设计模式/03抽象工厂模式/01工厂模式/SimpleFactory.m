//
//  SimpleFactory.m
//  01工厂模式
//
//  Created by fgy on 2019/8/13.
//  Copyright © 2019 test. All rights reserved.
//

#import "SimpleFactory.h"
@class ProductA,ProductB,FactoryA,FactoryB;

@implementation FactoryProduct
+ (id<Factory>)createFactory:(NSString *)productName{
    if ([productName isEqualToString:NSStringFromClass(FactoryA.class)]) {
        return [[FactoryA alloc]init];
    }else if ([productName isEqualToString:NSStringFromClass(FactoryB.class)]) {
        return [[FactoryB alloc]init];
    }else{
        return nil;
    }
}
@end
@implementation FactoryA
+ (id<Product>)createProduct:(NSString *)productName{
    if ([productName isEqualToString:NSStringFromClass(ProductA.class)]) {
        return [[ProductA alloc]init];
    }else{
        return nil;
    }
}
@end
@implementation FactoryB
+ (id<Product>)createProduct:(NSString *)productName{
    if ([productName isEqualToString:NSStringFromClass(ProductB.class)]){
        return [[ProductB alloc]init];
    }else{
        return nil;
    }
}
@end




@implementation ProductA
- (void)productMethod {
    
}
@end
@implementation ProductB
- (void)productMethod {
    
}
@end
