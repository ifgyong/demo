//
//  main.m
//  day11-runtime1
//
//  Created by Charlie on 2019/7/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"
#import "FYPerson.h"
#import "MJClassInfo.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		FYPerson *p = [[FYPerson alloc]init];

		mj_objc_class *cls = (__bridge mj_objc_class *)p.class;
		NSLog(@"-----");
		[p test];
	}
	return 0;
}
