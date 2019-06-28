//
//  main.m
//  day01-对象的本质1
//
//  Created by Charlie on 2019/6/28.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface Person : NSObject
{
	@public
	int _age;//4bytes
	int _no;//4bytes
}
@end
@implementation Person

@end

struct NSObject_IMPL {
	Class isa;
};
struct Person_IMPL {
	struct NSObject_IMPL NSObject_IVARS;
	int _age;
	int _no;
};

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		Person *obj=[[Person alloc]init];
		obj->_age = 6;
		obj->_no = 7;
		
		struct Person_IMPL *p = (__bridge struct Person_IMPL*)obj;
		NSLog(@"height:%d",p->_no);
		
		
		//获得NSobject对象实例成员变量占用的大小 ->8
		size_t size = class_getInstanceSize(obj.class);
		//获取NSObjet指针的指向的内存大小 ->16
		size_t size2 = malloc_size((__bridge const void *)(obj));
		NSLog(@"size:%zu size2:%zu",size,size2);
	}
	return 0;
}
