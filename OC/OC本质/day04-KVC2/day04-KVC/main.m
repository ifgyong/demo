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
		[p setValue:@(2) forKey:@"age"];
		
//		NSLog(@"age:%d isAge:%d _isAge:%d",(int)p->age,(int)p->isAge,(int)p->_isAge);
		
	}
	return 0;
}
