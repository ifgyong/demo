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
//        Method test1Method = class_getInstanceMethod(p.class, @selector(test));
//        Method test2Method = class_getInstanceMethod(p.class, @selector(test2));
//        IMP imp1= method_getImplementation(test1Method);
//        IMP imp2= method_getImplementation(test2Method);

		mj_objc_class *cls = (__bridge mj_objc_class *)p.class;
		NSLog(@"-----");
		[p test];
        /*
         key:init imp:0x7fff58807c2d
         key:class imp:0x7fff588084b7
         key:(null) imp:0x0
         key:test imp:0x100000bf0
         Program ended with exit code: 0
         */
        [p test2]; //当执行该函数的时候
        /*
         key:(null) imp:0x0
         key:(null) imp:0x0
         key:(null) imp:0x0
         key:(null) imp:0x0
         key:(null) imp:0x0
         key:(null) imp:0x0
         key:test2 imp:0x100000c20
         key:(null) imp:0x0
         */
        
		cache_t cache = cls->cache;
		bucket_t *buck = cache._buckets;
		
		
		for (int i = 0; i <= cache._mask; i ++) {
			bucket_t item = buck[i];
//            if (item._key != 0) {
////                printf("key:%s imp:%p \n",(const char *)item._key,item._imp);
//            }
            printf("key:%s imp:%p \n",(const char *)item._key,item._imp);

		}
	}
	return 0;
}
