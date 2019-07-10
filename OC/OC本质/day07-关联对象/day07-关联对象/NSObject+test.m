//
//  NSObject+test.m
//  day07-关联对象
//
//  Created by Charlie on 2019/7/8.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "NSObject+test.h"
#import "objc/runtime.h"
@implementation NSObject (test)
-(void)setName:(NSString *)name{
	objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY);
}
- (NSString *)name{
	return  objc_getAssociatedObject(self, @selector(name));
}

@end
