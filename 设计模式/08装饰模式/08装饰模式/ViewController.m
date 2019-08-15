//
//  ViewController.m
//  08装饰模式
//
//  Created by fgy on 2019/8/15.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"
#import "Component.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Component *cm =[[Component alloc]init];
    [cm opertion];//协议方法
    [cm addMethod];//新增方法
}


@end
