//
//  BaseViewController.m
//  OC-runtime
//
//  Created by Charlie on 2019/9/2.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
	NSDate *date =[NSDate new];
	[super viewDidLoad];
	NSLog(@"%@ time:%d", NSStringFromClass(self.class),(int)[[NSDate date] timeIntervalSinceDate:date]);
}

@end
