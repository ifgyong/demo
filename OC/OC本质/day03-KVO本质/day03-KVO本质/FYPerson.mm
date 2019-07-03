//
//  FYPerson.m
//  day03-KVO本质
//
//  Created by fgy on 2019/7/2.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson.h"

@implementation FYPerson
-(void)willChangeValueForKey:(NSString *)key{
	NSLog(@"%s",__func__);
	[super willChangeValueForKey:key];
}
- (void)didChangeValueForKey:(NSString *)key{
	NSLog(@"%s 开始",__func__);
	[super didChangeValueForKey:key];
	NSLog(@"%s 结束",__func__);
}
- (void)setAge:(double)age{
	_age = age;
	NSLog(@"%s",__func__);
}

@end
