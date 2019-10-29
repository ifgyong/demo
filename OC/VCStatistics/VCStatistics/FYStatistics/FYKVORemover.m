//
//  FYKVORemover.m
//  VCStatistics
//
//  Created by Charlie on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYKVORemover.h"

@implementation FYKVORemover
- (void)dealloc {
	[_target removeObserver:[FYKVOObserver shared] forKeyPath:_keyPath];
	_target = nil;
}
@end
