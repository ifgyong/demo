//
//  ViewController2.m
//  FYRuntimeAOP
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3ViewController.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat time = arc4random()%10/5.0f;
    usleep(time*1000000);
    float red = arc4random()%255/255.0;
    float green = arc4random()%255/255.0;
    float blue = arc4random()%255/255.0;
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    btn.backgroundColor =[UIColor whiteColor];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)pushVC{
    ViewController3ViewController *vc=[[ViewController3ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
