//
//  main.m
//  day09-block-copy
//
//  Created by Charlie on 2019/7/10.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYPerson.h"

typedef void (^FYBlock)(void);

int main(int argc, const char * argv[]) {
	@autoreleasepool {

			FYPerson *person = [[FYPerson alloc]init];
			person.age = 10;
		__weak typeof(person) __weakPerson = person;
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			NSLog(@"---%d",__weakPerson.age);
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
				NSLog(@"---%d",person.age);
			});
		});
//		sleep(3);
	}
	return 0;
}
