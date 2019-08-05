//
//  ViewController.m
//  day18-MVC-Apple
//
//  Created by fgy on 2019/8/5.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"
#import "FYAppleView.h"
#import "FYItemModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //apple版本的MVC
    FYAppleView *view=[[FYAppleView alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    view.nameLabel.text = @"我是名字";
    view.nameLabel.textColor =[UIColor blueColor];
    [self.view addSubview:view];
    
    [self loadViewOtherMVC];
}
//变种MVC 把View和Model建立起连接
//等以后更新view数据只需要 view.model = item;Controllr少了许多代码
- (void)loadViewOtherMVC{
    FYAppleView * view =[[FYAppleView alloc]initWithFrame:CGRectMake(200, 200, 100, 30)];
    FYItemModel *item=[[FYItemModel alloc]init];
    item.name = @"校长来了";
    item.bgColor = [UIColor redColor];
    view.model = item;
    [self.view addSubview:view];
}

@end
