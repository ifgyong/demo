//
//  Order.m
//  12命令模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Order.h"


@implementation Order
- (void)exe{
	[[Order1 new] play];
}
@end
@implementation Order1

- (void)play {
	NSLog(@"进入公园");
	[[Order2 new] play];
}

@end
@implementation Order2

- (void)play {
	NSLog(@"开始打球");
	[[Order3 new] play];
}

@end
@implementation Order3
- (void)play{
	NSLog(@"开始打羽毛球");
}
@end
