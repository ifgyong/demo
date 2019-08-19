//
//  Flyweight.m
//  10享元模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Flyweight.h"
@implementation FlyweightA

- (void)play{
	NSLog(@"我在玩耍");
}
- (void)eat{
	NSLog(@"我在吃饭");
}
@end

@implementation FlyweightB

- (void)play{
	NSLog(@"我在玩耍");
}
- (void)run{
	NSLog(@"我在跑步");
}
@end
