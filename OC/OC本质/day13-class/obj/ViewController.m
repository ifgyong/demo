//
//  ViewController.m
//  obj
//
//  Created by fgy on 2019/7/21.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"
#import "FYPerson.h"
@interface ViewController ()

@end

@implementation ViewController

void test(){//栈空间连续内存是从高到低
    int a= 0 ;//0x7ffeedf7f8fc  老大
    int b = 1;//0x7ffeedf7f8f8  老二
    int c = 2;//0x7ffeedf7f8f4  老三
    int d = 3;//0x7ffeedf7f8f0  老四
    NSLog(@" %p %p %p %p",&a,&b,&c,&d);
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    test();
    
    
    NSObject *fix =[NSObject new];
    // 0x7ff 开头的都是在堆上
    FYPerson *fix2 =[FYPerson new];
    
    id cls  = [FYPerson class];//cls 是类指针
    void * obj = &cls; //obj 指针指向cls的内存地址，访问obj相当于直接访问
//    cls内存存储的值，cls存储的是Person.class
    //[obj print] 相当于objc_msgSend(cls,@selector(print))
    [(__bridge id)obj print];//objc_msgSend(self,sel);
    
//fix: 0x7ffeec3d f928
//fix2:0x7ffeec3d f920
//cls: 0x7ffeec3d f918
//obj: 0x7ffeec3d f910
    NSLog(@"fix:%p fix2:%p cls:%p obj:%p",&fix,&fix2,&cls,&obj);
}


@end
