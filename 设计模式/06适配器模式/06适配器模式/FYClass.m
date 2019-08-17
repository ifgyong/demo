//
//  FYClass.m
//  06适配器模式
//
//  Created by fgy on 2019/8/16.
//  Copyright © 2019 test. All rights reserved.
//

#import "FYClass.h"

@implementation FYClass

@end
@implementation Adaptee

- (void)specificRequest{
    NSLog(@"适配器 第三方工人干活了");
}

@end
@implementation Adapter

+ (instancetype)initWithAdaptee:(Adaptee *)obj{
    Adapter *adapter=[Adapter new];
    adapter.adaptee = obj;
    return adapter;
}
//通过适配器 指导三方工人干活，达到 客户忽略过程，多个客户可以复用适配器代码
- (void)request{
    [self.adaptee specificRequest];
}

@end
