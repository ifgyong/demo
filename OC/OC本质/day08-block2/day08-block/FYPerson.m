//
//  FYPerson.m
//  day08-block
//
//  Created by fgy on 2019/7/9.
//  Copyright © 2019 test. All rights reserved.
//

#import "FYPerson.h"

@implementation FYPerson
- (void)test{
    void (^block)(void) = ^{
        NSLog(@"person is %@",self);
    };
    
    void (^block2)(void) = ^{
        NSLog(@"name is %@",_name);
    };
}
@end
