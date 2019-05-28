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
//        Class newClass = objc_allocateClassPair(objc_getClass("NSObject"), "newClass", 0);
//        objc_registerClassPair(newClass);
//        id newObject = [[newClass alloc]init];
//        NSLog(@"%@",newObject);


        register_Block();
        register_Block();
        register_Block();
        register_Block();
        register_Block();
        register_Block();
       Person *p =  [[Person new] init];
        [p say];
        
    }
    return 0;
}
static void register_Block(void){
    SEL didload = sel_registerName("say");
    Class aclass = Person.class;
    Method md = class_getInstanceMethod(aclass, didload);
    
    if (md) {
        //获取didload函数的的IMP
        IMP load = method_getImplementation(md);
        void(*loadFunc)(id,SEL) = (void *)load;
        __block typeof(Class) __blockClass = aclass;
        __block typeof(loadFunc)__blockFunc = loadFunc;
        __block typeof(didload) __sel = didload;
        void (^block)(id _self) = ^(id _self){
            //统计时间
            CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
            //执行ViewDidLoad IMP
            __blockFunc(__blockClass,__sel);
            NSLog(@"%s cost: %.2fs",class_getName(__blockClass),CFAbsoluteTimeGetCurrent() - time1);
        };
        //将 block block 转化成 IMP 存储到SEL ViewDidload 中
        
        void(*func)(id,SEL) =(void*)imp_implementationWithBlock(block);
        class_replaceMethod(aclass, didload, (IMP)func, method_getTypeEncoding(md));
        
    }
}
void checkClassKindAndMember(void){
    NSObject *item =[NSObject new];
    item = [Person new];
    NSLog(@"item isKindOfClass NSObject:%d",[item isKindOfClass:NSObject.class]);
//    NSLog(@"item isMemberOfClass NSObject:%d",[item isMemberOfClass:NSObject.class]);
    
    NSLog(@"Person class isKindOfClass NSObject:%d",[item.class isKindOfClass:NSObject.class]);
//    NSLog(@"Person class isMemberOfClass NSObject:%d",[item.class isMemberOfClass:NSObject.class]);
}
