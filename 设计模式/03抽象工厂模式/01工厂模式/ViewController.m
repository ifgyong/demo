//
//  ViewController.m
//  01工厂模式
//
//  Created by fgy on 2019/8/13.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"
#import "SimpleFactory.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/**
 
抽象工厂模式(Abstract Factory Pattern)：提供一个创建一系列相关或相互依赖对象的接口，而无须指定它们具体的类。抽象工厂模式又称为Kit模式，属于对象创建型模式。
 
 */
- (void)test{
    //创建工厂
    id<Factory> fa =[FactoryProduct createFactory:@"FactoryA"];
     //创建产品A
    ProductA *a = [fa performSelector:@selector(createProduct:) withObject:@"ProductA"];
    [a productMethod];
    //创建产品B
    ProductB *b = [fa performSelector:@selector(createProduct:) withObject:@"ProductB"];
    [b productMethod];
}


@end
