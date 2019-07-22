//
//  FYStudent.m
//  day13-super
//
//  Created by fgy on 2019/7/21.
//  Copyright © 2019 test. All rights reserved.
//

#import "FYStudent.h"

@implementation FYStudent
- (void)test{
    [super test]; //执行父类的test
    int age = [super age]; //获取父类的方法 返回值
    NSLog(@"age is %d",age);
    NSString * name = [self name]; //从父类开始寻找name的值，但返回的是self.name的值
    NSLog(@"%@",name);
}
-(int)age{
    return 12;
}
@end
