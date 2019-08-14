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
 
工厂方法模式(Factory Method Pattern)又称为工厂模式，也叫虚拟构造器(Virtual Constructor)模式或者多态工厂(Polymorphic Factory)模式，它属于类创建型模式。在工厂方法模式中，工厂父类负责定义创建产品对象的公共接口，而工厂子类则负责生成具体的产品对象，这样做的目的是将产品类的实例化操作延迟到工厂子类中完成，即通过工厂子类来确定究竟应该实例化哪一个具体产品类。
 
 */
- (void)test{
    //创建产品A
    ProductA *a =[FactoryA createProduct:NSStringFromClass(ProductA.class)];
    [a productMethod];
    //创建产品B
    ProductB *b =[FactoryB createProduct:NSStringFromClass(ProductB.class)];
    [b productMethod];
}


@end
