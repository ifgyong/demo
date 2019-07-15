//
//  main.m
//  day10-runtime
//
//  Created by Charlie on 2019/7/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYPerson.h"
#import <objc/runtime.h>


int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
	    NSLog(@"Hello, World!");
		FYPerson *p=[[FYPerson alloc]init];
		p.handsome = YES;
		p.rich = YES;
		p.rich = NO;
		NSLog(@"%zu rich:%d handsome:%d",class_getInstanceSize(FYPerson.class),[p isRich],[p isHandsome]);
	}
	return 0;
}
