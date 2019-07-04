//
//  ViewController.m
//  testmsghook
//
//  Created by Charlie on 2019/7/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "main.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	init_hook();
	hook_callback(self,@selector(hello));
}
-(void)hello{
	NSLog(@"123");
}


@end
