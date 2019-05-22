//
//  Order.m
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Order.h"


@implementation Stock
- (instancetype)init{
    self =[super init];
    self.name = @"ABC";
    self.quantity = 9;
    return self;
}
- (void)buy{
    NSLog(@"Stock:bug Name:%@ qutity:%d",self.name,self.quantity);
}
- (void)sell{
    NSLog(@"Stock:sell Name:%@ qutity:%d",self.name,self.quantity);
}

@end
@implementation BuyStock

+ (instancetype)BuyStock:(Stock *)s{
    BuyStock *buy=[[BuyStock alloc]init];
    buy.stock = s;
    return buy;
}
- (void)execute{
    [self.stock buy];
}

@end

@implementation SellStock

+ (instancetype)SellStock:(Stock *)s{
    SellStock *buy=[[SellStock alloc]init];
    buy.stock = s;
    return buy;
}
- (void)execute{
    [self.stock sell];
}

@end

@implementation Order
-(NSMutableArray <id<OrderProtocol>>*)list{
    if (_list == nil    ) {
        _list =[NSMutableArray array];
    }
    return _list;
}
- (void)takeOrder:(id<OrderProtocol>)od{
    if ([od conformsToProtocol:@protocol(OrderProtocol)]) {
        [self.list addObject:od];
    }
}
- (void)placeOrder{
    for (id<OrderProtocol> item in self.list) {
        [item performSelector:@selector(execute)];
    }
}
@end
