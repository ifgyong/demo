//
//  FYVCcall.m
//  VCStatistics
//
//  Created by Charlie on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYVCcall.h"

@implementation FYVCcall
+ (instancetype)shared {
	static FYVCcall * ccall;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		ccall = [[FYVCcall alloc] init];
	});
	return ccall;
}
@end
