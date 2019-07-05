//
//  main.m
//  day04-KVC
//
//  Created by Charlie on 2019/7/5.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYPerson.h"
int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		FYPerson *p=[[FYPerson alloc]init];
		
		[p addObserver:p
			forKeyPath:@"age"
			   options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
			   context:nil];
		[p setValue:@2 forKey:@"age"];
		[p removeObserver:p forKeyPath:@"age"];
		
	}
	return 0;
}
