//
//  YQKVORemover.m
//  iOSDemo
//
//  Created by 李 on 2019/1/24.
//  Copyright © 2019 yangkun. All rights reserved.
//

#import "YQKVORemover.h"
#import "YQKVOObserver.h"

@implementation YQKVORemover

- (void)dealloc {
    [_target removeObserver:[YQKVOObserver shared] forKeyPath:_keyPath];
    _target = nil;
}
@end
