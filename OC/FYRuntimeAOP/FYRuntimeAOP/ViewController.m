//
//  ViewController.m
//  FYRuntimeAOP
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+add.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self logSelf];
    sleep(2);
    printf("%s %s:%.2f \n",NSStringFromClass(self.class).UTF8String,__func__,CFAbsoluteTimeGetCurrent());
    // Do any additional setup after loading the view.
}
- (void)say{
    NSLog(@"%s",__func__);
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ViewController2 *vc=[[ViewController2 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
