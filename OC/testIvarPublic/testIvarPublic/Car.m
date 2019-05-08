//
//  Car.m
//  testIvarPublic
//
//  Created by Charlie on 2019/5/8.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Car.h"

@implementation Car
+ (void)load{
    printf("\nCar %s",__FUNCTION__);
}
+ (void) initialize{
    printf("\nCar %s",__FUNCTION__);
}
@end
