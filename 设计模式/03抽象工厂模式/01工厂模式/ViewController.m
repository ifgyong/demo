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
 
 简单工厂模式(Simple Factory Pattern)：又称为静态工厂方法(Static Factory Method)模式，它属于类创建型模式。在简单工厂模式中，可以根据参数的不同返回不同类的实例。简单工厂模式专门定义一个类来负责创建其他类的实例，被创建的实例通常都具有共同的父类。
 
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
