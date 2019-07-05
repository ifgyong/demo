//
//  main.m
//  day05-Category
//
//  Created by Charlie on 2019/7/5.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYPerson.h"
#import "FYPerson+Ete.h"
#import "FYPerson+test.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		FYPerson *person=[[FYPerson alloc]init];
		[person test];
		[person play];
		[person run];
	}
	return 0;
}
