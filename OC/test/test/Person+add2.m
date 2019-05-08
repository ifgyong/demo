//
//  Person+add2.m
//  test
//
//  Created by Charlie on 2019/5/7.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Person+add2.h"

@implementation Person (add2)
- (void)good{
    
    self->protectedName = @"1";
    self->packageName = @"2";
    self->publicName = @"3";
    self->privateName = @"4"; //报错
    
    Person *p=[Person new];
    p->protectedName = @"1";
    p->packageName = @"2";
    p->publicName = @"3";
    p->privateName = @"4";//报错
}
@end
