//
//  main.m
//  objc-test
//
//  Created by GongCF on 2018/12/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <dlfcn.h>
#import <mach-o/ldsyms.h>
#import "Person.h"


void checkClassKindAndMember(void);
static void register_Block(void);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        register_Block();
        register_Block();
        Person *p =  [[Person new] init];
        Class aclass = Person.class;
        SEL didload = @selector(say);
        Method md = class_getInstanceMethod(aclass, didload);
        IMP imp= class_getMethodImplementation(aclass, didload);
        NSLog(@"new2IMP:%p",imp);

        [p say];
    }
    return 0;
}
static void register_Block(void){
    SEL didload = @selector(say);
    Class aclass = Person.class;
    Method md = class_getInstanceMethod(aclass, didload);
    
    if (md) {
        //获取didload函数的的IMP
        IMP load = method_getImplementation(md);
        NSLog(@"load:%p",load);
        void(*loadFunc)(id,SEL) = (void *)load;
        __block typeof(Class) __blockClass = aclass;
        __block typeof(loadFunc)__blockFunc = loadFunc;
        __block typeof(didload) __sel = didload;
        void (^block)(id _self) = ^(id _self){
            //统计时间
            CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
            //执行ViewDidLoad IMP
            __blockFunc(__blockClass,__sel);
            NSLog(@"1:%s cost: %.2fs",class_getName(__blockClass),CFAbsoluteTimeGetCurrent() - time1);
        };
        //将 block block 转化成 IMP 存储到SEL ViewDidload 中
        
        void(*func)(id,SEL) =(void*)imp_implementationWithBlock(block);
        class_replaceMethod(aclass, didload, (IMP)func, method_getTypeEncoding(md));
        
        static int count = 0;

        void (^block2)(id _self) = ^(id _self){
            count ++;
            
            //统计时间
            CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
            //执行ViewDidLoad IMP
            __blockFunc(__blockClass,__sel);
            NSLog(@"2:%s cost: %.2fs",class_getName(__blockClass),CFAbsoluteTimeGetCurrent() - time1);
        };
//        IMP new1 = class_getMethodImplementation(aclass, didload);
//        NSLog(@"new1IMP:%p",new1);
        void(*func2)(id,SEL) =(void*)imp_implementationWithBlock(block2);
        class_replaceMethod(aclass, didload, (IMP)func2, method_getTypeEncoding(md));
        class_replaceMethod(aclass, didload, (IMP)func2, method_getTypeEncoding(md));

        IMP new2 = class_getMethodImplementation(aclass, didload);
        NSLog(@"new2IMP:%p block2:%p",new2,block2);
    }
}
