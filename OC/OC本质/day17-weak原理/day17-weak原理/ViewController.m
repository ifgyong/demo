//
//  ViewController.m
//  day17-weak原理
//
//  Created by Charlie on 2019/8/1.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	__strong	FYPerson *p1 ;//=[[FYPerson alloc]init];
	__weak FYPerson *p2;
	__unsafe_unretained FYPerson * p3;
	NSLog(@"start");
	{
		FYPerson *p =[[FYPerson alloc]init];
		p2 = p;
	}
	NSLog(@"end -- %@",p3);
}
-(void)dealloc{
	NSLog(@"%s",__func__);
}


@end
