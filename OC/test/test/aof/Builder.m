////
////  Builder.m
////  test
////
////  Created by Charlie on 2019/5/20.
////  Copyright © 2019 www.fgyong.cn. All rights reserved.
////
//
//#import "Builder.h"
//
//
//
//
//@implementation Wrapper
//
//- (NSString *)pack{
//    return @"Wrapper";
//}
//
//@end
//@implementation Bottle
//
//- (NSString *)pack{
//    return @"Bottle";
//}
//
//@end
//
//@implementation Burger
//
//- (Packing*)packing{
//    return [Wrapper new];
//}
//- (float)price{
//    return 0.0f;
//}
//- (nonnull NSString *)name {
//    return @"";
//}
//@end
//@implementation ColdDrink
//
//- (Packing*)packing{
//    return [Bottle new];
//}
//- (float)price{
//    return 0.0f;
//}
//
//- (nonnull NSString *)name {
//    return @"";
//}
//
//@end
//
//@implementation VegBurger
//
//- (float)price{
//    return 25.0f;
//}
//- (NSString *)name{
//    return @"Veg Burger";
//}
//
//@end
//
//
//@implementation ChickenBurger
//
//- (float)price{
//    return 50.0f;
//}
//- (NSString *)name{
//    return @"Chicken Burger";
//}
//@end
//
//@implementation Pepsi
//
//-(float)price{
//    return 35.0f;
//}
//- (NSString *)name{
//    return @"Pepsi";
//}
//@end
//@implementation Coke
//
//-(float)price{
//    return 30.0f;
//}
//- (NSString *)name{
//    return @"Coke";
//}
//@end
//
//@interface Meal ()
//@property (nonatomic,strong) NSMutableArray *list;
//@end
//@implementation Meal
//- (NSMutableArray *)list{
//    if (_list == nil) {
//        _list=[NSMutableArray array];
//    }
//    return _list;
//}
//- (void)addItem:(Item *)item{
//    if ([item isKindOfClass:[item class]]) {
//        [_list addObject:item];
//    }
//}
//- (float)getCost{
//    float  count = 0.f;
//    for (Item *it in self.list) {
//        if ([it isKindOfClass:[Item class]]) {
//            count += it.price;
//        }
//    }
//    return count;
//}
//- (void)showItems{
//    for (Item *it in self.list) {
//        if ([it isKindOfClass:[Item class]]) {
//            NSLog(@"Item:%@",it.name);
//            NSLog(@"Packing:%@",it.packing.pack);
//            NSLog(@"price:%f",it.price);
//        }
//    }
//}
//@end
//
//@implementation MealBuild
//
//-(Meal *)prepareNoneVeMeal{
//    Meal *ml = [Meal new];
//    [ml addItem:[ChickenBurger new]];
//    [ml addItem:[Pepsi new]];
//    return ml;
//}
//- (Meal *)prepareVeMeal{
//    Meal *ml = [Meal new];
//    [ml addItem:[VegBurger new]];
//    [ml addItem:[Coke new]];
//    return ml;
//}
//
//@end
