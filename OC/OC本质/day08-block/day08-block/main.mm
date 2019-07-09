//
//  main.m
//  day08-block
//
//  Created by fgy on 2019/7/8.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>
//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
//};
//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int flags=0) {
//        impl.isa = &_NSConcreteStackBlock;
//        impl.Flags = flags;
//        impl.FuncPtr = fp;
//        Desc = desc;
//    }
//};
//static struct __main_block_desc_0 {
//    size_t reserved;
//    size_t Block_size;
//} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};
void(^block)(void);
void test(){
    int age = 10;
    static int level = 12;
    block = ^(void){
        NSLog(@"age is %d,level is %d",age,level);
    };
    age = 20;
    level = 13;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test();
        block();

    }
    return 0;
}
