//
//  FYPerson.m
//  day13-super
//
//  Created by fgy on 2019/7/21.
//  Copyright © 2019 test. All rights reserved.
//

#import "FYPerson.h"

@implementation FYPerson
- (void)test{
    ;    NSLog(@"%s",__func__);
}
- (int)age{
    NSLog(@"%s",__func__);
    return 10;
}
- (NSString *)name{
    return [_name stringByAppendingString:@" eat apple"];
}
@end
