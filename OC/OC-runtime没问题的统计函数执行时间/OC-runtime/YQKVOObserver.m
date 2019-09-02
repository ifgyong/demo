//
//  YQKVOObserver.m
//  iOSDemo
//
//  Created by 李on 2019/1/24.
//  Copyright © 2019 yangkun. All rights reserved.
//

#import "YQKVOObserver.h"



@implementation YQKVOObserver
+ (instancetype)shared {
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
    });
    return sharedInstance;
}
@end
