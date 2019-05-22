//
//  Order.h
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OrderProtocol <NSObject>
- (void)execute;
@end
@interface Stock : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign)int quantity;
- (void)buy;
- (void)sell;
@end



@interface BuyStock : NSObject <OrderProtocol>
@property (nonatomic,strong) Stock *stock;
+ (instancetype)BuyStock:(Stock *)s;
@end
@interface SellStock : NSObject <OrderProtocol>
@property (nonatomic,strong) Stock *stock;
+ (instancetype)SellStock:(Stock *)s;
@end

@interface Order : NSObject
@property (nonatomic,strong) NSMutableArray <id<OrderProtocol>> *list;
- (void)takeOrder:(id<OrderProtocol >)od;
- (void)placeOrder;
@end

NS_ASSUME_NONNULL_END
