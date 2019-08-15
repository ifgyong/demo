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
    //A工厂生产产品
    ProductA1 *a1 =[Factory1 createProductA:NSStringFromClass(ProductA1.class)];
	ProductA1 *a2 =[Factory1 createProductA:NSStringFromClass(ProductA2.class)];
	[a1 productMethod];
	[a2 productMethod];
	
	//B工厂生产产品B
	//此处 省略代码
	
	
}


@end
