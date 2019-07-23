//
//  ViewController.m
//  CFRunloop
//
//  Created by Charlie on 2019/7/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYPermenantThread.h"

@interface ViewController ()
//@property (nonatomic,strong) FYThread *thread;
@property (nonatomic,strong) FYPermenantThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    self.thread = [[FYPermenantThread alloc]init];
    [self.thread run];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	NSLog(@"%s",__func__);
//    [self.thread exceTaskWithBlock:^{
//        NSLog(@"我是block 在执行中");
//    }];
    [self.thread exceTaskWithTarget:self action:@selector(test) obj:nil];
}
- (void)test{
    NSLog(@"%s",__func__);
}
//返回上页
- (IBAction)popVC:(id)sender {
	
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)dealloc{
    [self.thread stop];
	NSLog(@"%s",__func__);
}
@end
