//
//  Singleton.m
//  test
//
//  Created by Charlie on 2019/5/20.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
+ (id)share{
    static dispatch_once_t onceToken;
    static Singleton *item;
    dispatch_once(&onceToken, ^{
        item = [Singleton new];
    });
    return item;
}
- (void)showMessage{
    NSLog(@"inside showMessage method");
}
@end
