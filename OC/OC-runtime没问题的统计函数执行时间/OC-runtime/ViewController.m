//
//  ViewController.m
//  OC-runtime
//
//  Created by Charlie on 2019/8/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	printf("%s",__func__);
}
- (void)viewDidLoad {
	[super viewDidLoad];
	sleep(rand()%4);
	self.view.backgroundColor = [UIColor greenColor];
//	printf("\n3");
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	ViewController2 *vc=[[ViewController2 alloc]init];
	[self presentViewController:vc animated:YES completion:nil];
}

@end
