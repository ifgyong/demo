//
//  main.m
//  day13-super
//
//  Created by fgy on 2019/7/21.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYStudent.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        FYStudent *stu=[FYStudent new];
        stu.name = @"小李子";
        [stu test];
    }
    return 0;
}
