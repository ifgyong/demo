//
//  Context.m
//  16策略模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Context.h"

@implementation Context
- (void)opertion{
	[self.obj handle];
}
@end
@implementation Strategy
- (void)handle{}
@end
@implementation StrategyA

- (void)handle{
	NSLog(@"老三 算数");
}

@end
@implementation StrategyB

- (void)handle{
	NSLog(@"老四 算数");
}

@end
