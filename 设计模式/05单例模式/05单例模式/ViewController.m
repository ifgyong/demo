//
//  ViewController.m
//  05单例模式
//
//  Created by Charlie on 2019/8/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "Singleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	Singleton  *ton=[Singleton getInstace];
	//code
}


@end
