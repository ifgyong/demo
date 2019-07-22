//
//  Student.m
//  day13-super
//
//  Created by Charlie on 2019/7/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Student.h"

@implementation Student
-(instancetype)init{
	if (self =[super init]) {
		NSLog(@"self.class:%@",self.class);// Student
		NSLog(@"self.superclass:%@",self.superclass); //	FYPerson
		
		NSLog(@"-------");
		
		NSLog(@"super.class:%@",super.class);//Student
		NSLog(@"super.superclass:%@",super.superclass);//	FYPerson
		//super 本质上是 一个结构体，接收者还是self，只是查找方法是从superclass开始查找
		//super.superclass 本质上是self.superclass,因为superclass的实现是NSObject实现的，
//		最终都是在NSObject找到方法，接收者仍然是self。所以最终r返回是FYPerson
	}
	return self;
}
@end
