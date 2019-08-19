//
//  StateClass.m
//  15状态模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "StateClass.h"

@implementation StateClass
- (void)setS:(State)s{
	switch (s) {
		case StateOpen:
		{
			NSLog(@"飞机已启动");
		}
			break;
		case StateClose:
		{
			NSLog(@"飞机已落地");
		}
			break;
			
		default:
			break;
	}
}
@end
