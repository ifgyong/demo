//
//  Singleton.m
//  05单例模式
//
//  Created by Charlie on 2019/8/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
+ (instancetype)getInstace{
	static dispatch_once_t onceToken;
	static Singleton *_t;
	dispatch_once(&onceToken, ^{
		_t = [Singleton new];
	});
	return _t;
}
@end
