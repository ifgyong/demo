//
//  NSMutableArray+add.m
//  day14-方法交换
//
//  Created by Charlie on 2019/7/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "NSMutableArray+add.h"
#import "objc/runtime.h"

@implementation NSMutableArray (add)
+ (void)load{
	Class cls= NSClassFromString(@"__NSArrayM");
	Method m1= class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
	SEL sel = @selector(fy_insertObject:atIndex:);
	Method m2= class_getInstanceMethod(cls, sel);
	
	Method m3= class_getInstanceMethod(cls, @selector(objectAtIndexedSubscript:));
	Method m4= class_getInstanceMethod(cls, @selector(fy_objectAtIndexedSubscript:));

	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		method_exchangeImplementations(m1, m2);
		method_exchangeImplementations(m3, m4);
	});
}

- (void)fy_insertObject:(id)anObject atIndex:(NSUInteger)index{
	if (anObject != nil) {
		[self fy_insertObject:anObject atIndex:index];
	}else{
		printf(" anObject is nil \n");
	}
}
- (id)fy_objectAtIndexedSubscript:(NSUInteger)idx{
	if (self.count > idx) {
		return [self fy_objectAtIndexedSubscript:idx];
	}else{
		printf(" %ld is outof rang \n",(long)idx);
		return nil;
	}
}
@end
