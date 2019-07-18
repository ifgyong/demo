//
//  main.m
//  day12-消息转发1
//
//  Created by fgy on 2019/7/17.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import <objc/runtime.h>
#import <objc/message.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//		NSLog(@"s:%p p:%p",Student.class,Person.class);
		Person *p = [[Person alloc]init];
		[Person test3];
//		objc_msgSend(Person.class,@selector(test3));
    }
    return 0;
}
