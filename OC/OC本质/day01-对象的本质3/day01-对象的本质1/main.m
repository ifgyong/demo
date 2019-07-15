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
//Person
@interface Person : NSObject
{
	@public
	int _age;//4bytes
	int _level;//4bytes
	int _code;//4bytes
}
@end
@implementation Person
@end

//Student
@interface Student : Person
{
@public
	int _no;//4bytes
	int _no2;//4bytes
	NSString *_name;//8bytes
}
@end
@implementation Student
@end

struct NSObject_IMPL {
	Class isa;
};
struct Person_IMPL {
	struct NSObject_IMPL NSObject_IVARS;
	int _age;
};
struct Student_IMPL {
	struct Person_IMPL Person_IVARS;
	int _no;int _no2;
};

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		Person *obj=[[Person alloc]init];
		Person *obj2=[[Person alloc]init];
		obj->_age = 6;
//		obj->_no = 7;
//		obj->_name=@"12";
		
//		struct Student_IMPL *p = (__bridge struct Student_IMPL*)obj;
//		NSLog(@"height:%d",p->Person_IVARS._age);
		//0x00007ffffffffff8ULL 0x0000000ffffffff8ULL
		
		//获得NSobject对象实例成员变量占用的大小 ->24
		Class ocl = obj.class;
		size_t size = class_getInstanceSize(ocl);
		//获取NSObjet指针的指向的内存大小 ->32
		size_t size2 = malloc_size((__bridge const void *)(obj));
		printf("InstanceSize:%zu malloc_size:%zu  sizeof:%lu\n",size,size2,sizeof(size_t));
		
		
	}
	return 0;
}
