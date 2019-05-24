//
//  ViewController3ViewController.m
//  FYRuntimeAOP
//
//  Created by Charlie on 2019/5/24.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController3ViewController.h"

@interface ViewController3ViewController ()

@end

@implementation ViewController3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pushVC{
    ViewController2 *vc=[[ViewController2 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
