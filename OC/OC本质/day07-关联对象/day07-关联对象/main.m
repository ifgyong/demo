//
//  main.m
//  day07-关联对象
//
//  Created by Charlie on 2019/7/8.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+test.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		NSObject *obj =[[NSObject alloc]init];
		obj.name = @"老弟来了";
		printf("%s",obj.name.UTF8String);
	}
	return 0;
}
