//
//  FYPerson.m
//  day17-copy-1
//
//  Created by Charlie on 2019/7/31.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson.h"
#import <objc/runtime.h>

@interface FYPerson()<NSCopying>
@end

@implementation FYPerson
-(instancetype)copyWithZone:(NSZone *)zone{
	FYPerson *p=[[FYPerson alloc]init];
//	p.age = self.age;
//	p.level = self.level;
	
	unsigned int count;
	Ivar *ivars = class_copyIvarList(self.class, &count);
	for (int i = 0; i < count; i ++) {
		Ivar var = ivars[i];
		const char * name = ivar_getName(var);
		if (name != nil) {
			NSString *v = [NSString stringWithUTF8String:name];
			id value = [self valueForKey:v];
			[p setValue:value forKey:v];
		}
	}
	free(ivars);
	return p;
}

@end
