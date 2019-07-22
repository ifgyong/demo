//
//  main.m
//  day13-super2
//
//  Created by Charlie on 2019/7/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYCat.h"
#import "NSObject+Json.h"
#import "objc/runtime.h"


int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		NSDictionary * info = @{@"age":@"10",@"value":@10,@"name":@"小明"};
		FYCat *cat=[FYCat fy_objectWithJson:info];
		printf("age:%d name:%s",cat.age,cat.name.UTF8String);
////		[cat run];
//		unsigned int count = 0;
//		Ivar *vars= class_copyIvarList(cat.class, &count);
//		for (int i = 0; i < count; i ++) {
//			Ivar item = vars[i];
//			const char *name = ivar_getName(item);
//			NSLog(@"%s",name);
//		}
//		free(vars);
//
//		Method *m1= class_copyMethodList(cat.class, &count);
//		for (int i = 0; i < count; i ++) {
//			Method item = m1[i];
//			SEL name = method_getName(item);
//			printf("method:%s \n",NSStringFromSelector(name).UTF8String);
//		}
//		free(m1);
	}
	return 0;
}
