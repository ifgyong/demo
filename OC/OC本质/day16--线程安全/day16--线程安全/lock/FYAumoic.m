//
//  FYAumoic.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYAumoic.h"

@implementation FYAumoic
-(void)setCount:(int)count{
	//加锁
	_count = count;
	//解锁
}
- (int)count{
	//加锁
	//解锁
	return _count;
}
@end
