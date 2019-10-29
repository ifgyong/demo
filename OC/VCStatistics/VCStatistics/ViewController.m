//
//  ViewController.m
//  VCStatistics
//
//  Created by Charlie on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYVCcall.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	sleep(2);
	// 每个函数的回调，独立可以单独设置的。
	FYVCcall *cll = [FYVCcall shared];
	[cll setCallback:^(CFAbsoluteTime loadTime, UIViewController * _Nonnull kvo_self, NSString * _Nonnull funcName,NSString *str) {
		const char *clsName = NSStringFromClass(kvo_self.class).UTF8String;
		printf("cls:%s func:%s %f %s \n",clsName,funcName.UTF8String,loadTime,str.UTF8String);
	}];
	 
}


@end
