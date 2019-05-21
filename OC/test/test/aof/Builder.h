////
////  Builder.h
////  test
////
////  Created by Charlie on 2019/5/20.
////  Copyright © 2019 www.fgyong.cn. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//
//NS_ASSUME_NONNULL_BEGIN
//
//@interface Packing : NSObject
//- (NSString *)pack;
//@end
//@interface Wrapper : Packing
//- (NSString *)pack;
//@end
//@interface Bottle : Packing
//- (NSString *)pack;
//@end
//
//
//
//
//@interface Item : NSObject
//- (NSString*)name;
//- (Packing*)packing;
//- (float)price;
//@end
//
//@interface Burger : Item
//- (Packing *)packing;
//- (float)price;
//- (NSString *)name;
//@end
//
//@interface ColdDrink : Item
//- (Packing *)packing;
//- (float)price;
//- (NSString *)name;
//@end
//
//@interface VegBurger : Burger
//- (float)price;
//- (NSString *)name;
//@end
//
//@interface ChickenBurger : Burger
//- (float)price;
//- (NSString *)name;
//@end
//
//@interface Coke : ColdDrink
//- (float)price;
//- (NSString *)name;
//
//@end
//
//@interface Pepsi : ColdDrink
//- (float)price;
//- (NSString *)name;
//
//@end
//
//@interface Meal : NSObject
//
//- (void)addItem:(Item *)item;
//- (float)getCost;
//- (void)showItems;
//@end
//
//
//@interface MealBuild : NSObject
//
//- (Meal*)prepareVeMeal;
//
//- (Meal*)prepareNoneVeMeal;
//
//@end
//
//
//NS_ASSUME_NONNULL_END
