//
//  Component.m
//  08装饰模式
//
//  Created by fgy on 2019/8/15.
//  Copyright © 2019 test. All rights reserved.
//

#import "Component.h"


@implementation ComponentA
- (void)opertion{
    NSLog(@"ComponentA opertion ");
}
@end

@implementation ComponentB
- (void)opertion{
    NSLog(@"ComponentB opertion ");
}
@end



@implementation ComponentA (add)
- (void)addMethod{
    NSLog(@"addMethod");
}
@end
