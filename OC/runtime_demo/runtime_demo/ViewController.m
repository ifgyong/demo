//
//  ViewController.m
//  runtime_demo
//
//  Created by fgy on 2019/4/18.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <dlfcn.h>
#import <mach-o/ldsyms.h>


struct NSObject_IMPL {
    Class isa;
};
struct Student_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _age;
    int _no;
    NSString *_name;
};
@interface Student : NSObject{
@public
    int _age;
    int _no;
}
@property NSString *name;
- (void)aa;
@end
@implementation Student
- (void)aa{
    
}
@end
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    void (^block)(int)=^(int a){
        NSLog(@"block:%d",a);
    };
//    IMP imp = imp_implementationWithBlock(block);
    
    void(*fun)(id,SEL) = (void*)imp_implementationWithBlock(block);
    block(2);
    fun(nil,NULL);
    Class newClass = objc_allocateClassPair(objc_getClass("NSObject"), "newClass", 0);
    
    SEL _sel = sel_registerName("log2");

    class_addMethod(newClass, _sel, (IMP)fun, "v:i");
    objc_registerClassPair(newClass);
    [[newClass new] performSelector:_sel withObject:@(3)];
    
    
    void (^block2)(void) = ^(void){
        NSLog(@"block2");
    };
    void (*fun2)(id,SEL) =(void *) imp_implementationWithBlock(block2);
    fun2(nil,NULL);
    
    
    
}

@end
