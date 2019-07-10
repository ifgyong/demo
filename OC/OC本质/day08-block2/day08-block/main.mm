//
//  main.m
//  day08-block
//
//  Created by fgy on 2019/7/8.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>
int age = 10;
static int level = 12;
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        void(^block)(void) = ^(void){
            NSLog(@"age is %d,level is %d",age,level);
        };
        age = 20;
        level = 13;
        block();
    }
    return 0;
}
