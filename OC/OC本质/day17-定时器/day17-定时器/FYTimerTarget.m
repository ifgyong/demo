//
//  FYTimerTarget.m
//  day17-定时器
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYTimerTarget.h"

@implementation FYTimerTarget
-(id)forwardingTargetForSelector:(SEL)aSelector{
	return self.target;
}
- (void)dealloc{
	NSLog(@"%s",__func__);
}
@end
