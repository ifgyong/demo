//
//  main.m
//  day09-block2
//
//  Created by Charlie on 2019/7/10.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYPerson.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		{
        	FYPerson *obj=[[FYPerson alloc]init];
			[obj test];
			NSLog(@"block 执行完毕--------------");
		}
		NSLog(@"超出person范围应该已经死了");
	}
	return 0;
}
