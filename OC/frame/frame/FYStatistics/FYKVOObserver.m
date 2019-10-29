//
//  FYKVOObserver.m
//  VCStatistics
//
//  Created by Charlie on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYKVOObserver.h"

@implementation FYKVOObserver
+ (instancetype)shared {
	static id sharedInstance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[self alloc] init];
		
	});
	return sharedInstance;
}
@end
