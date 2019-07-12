//
//  main.m
//  day09-block2
//
//  Created by Charlie on 2019/7/10.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef   void (^FYBlock)(void);
@interface FYPerson : NSObject
@property (nonatomic,assign) int age ;
@end
@implementation FYPerson
-(void)dealloc{
	NSLog(@"%s",__func__);
}
@end
struct __Block_byref_age_0 {
	void *__isa;
	struct __Block_byref_age_0 *__forwarding;
	int __flags;
	int __size;
	int age;
};
struct __block_impl {
	void *isa;
	int Flags;
	int Reserved;
	void *FuncPtr;
};
struct __main_block_desc_0 {
	size_t reserved;
	size_t Block_size;
	void (*copy)(void);
	void (*dispose)(void);
};
struct __main_block_impl_0 {
	struct __block_impl impl;
	struct __main_block_desc_0* Desc;
	FYPerson *__unsafe_unretained __unsafe_obj;
};

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		FYBlock block;
		{
			FYPerson *obj=[[FYPerson alloc]init];
			obj.age = 5;
			__unsafe_unretained typeof(obj) __unsafe_obj = obj;
			block = ^{
				
				NSLog(@"obj->age is %d obj:%p",__unsafe_obj.age,&__unsafe_obj);
			};
			struct __main_block_impl_0 *suct = (__bridge struct __main_block_desc_0 *)block;
			NSLog(@"inside struct->obj:%p",suct->__unsafe_obj);
		}
		struct __main_block_impl_0 *suct = (__bridge struct __main_block_desc_0 *)block;
		NSLog(@"outside struct->obj:%p",suct->__unsafe_obj);
		block();
		NSLog(@"----end------");
	}
	return 0;
}
