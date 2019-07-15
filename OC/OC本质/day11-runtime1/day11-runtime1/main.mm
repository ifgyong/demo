//
//  main.m
//  day11-runtime1
//
//  Created by Charlie on 2019/7/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"
#import "FYPerson.h"
#import "MJClassInfo.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
	    NSLog(@"Hello, World!");
		FYPerson *p = [[FYPerson alloc]init];
		Method test1Method = class_getInstanceMethod(p.class, @selector(test));
		Method test2Method = class_getInstanceMethod(p.class, @selector(test2));
		IMP imp1= method_getImplementation(test1Method);
		IMP imp2= method_getImplementation(test2Method);

		mj_objc_class *cls = (__bridge mj_objc_class *)p.class;
		NSLog(@"-----");
		[p test];
		[p test2];
		cache_t cache = cls->cache;
		bucket_t *buck = cache._buckets;
		
		
		for (int i = 0; i <= cache._mask; i ++) {
			bucket_t item = buck[i];
			if (item._key != 0) {
				NSLog(@"key:%lu imp:%p",item._key,item._imp);
			}
		}
	}
	return 0;
}
