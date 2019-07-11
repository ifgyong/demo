//
//  main.m
//  day09-block2
//
//  Created by Charlie on 2019/7/10.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef   void (^FYBlock)(void);

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
	__block	int age = 10;
        NSLog(@" age1:%p",&age);
        NSObject *obj=[[NSObject alloc]init];
        FYBlock block = ^{
            
            NSLog(@"age is %d,obj is %p",age,&obj);
        };
		NSLog(@"%@",[(^{ NSLog(@"age is") ; }) class]);
	}
	return 0;
}
