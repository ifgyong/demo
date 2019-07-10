//
//  main.m
//  day09-block2
//
//  Created by Charlie on 2019/7/10.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef   void (^FYBlock)(void);
struct __Block_byref_age_0 {
    void *__isa;
    struct __Block_byref_age_0 *__forwarding;
    int __flags;
    int __size;
    int age;//10
};
struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
    void (*copy)(void);
    void (*dispose)(void);
};
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};
struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    struct __Block_byref_age_0 *age; // by ref
};

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
	__block	int age = 10;
        NSLog(@" age1:%p",&age);

        FYBlock block = ^{
            age = 20;//会报错
            NSLog(@"age is %d",age);
        };
        struct __main_block_impl_0 *main= (__bridge struct __main_block_impl_0 *)block;
        NSLog(@" age1:%p age2:%p",&age,&(main->age->__forwarding->age));

	}
	return 0;
}
