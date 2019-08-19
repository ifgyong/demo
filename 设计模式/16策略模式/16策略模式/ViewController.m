//
//  ViewController.m
//  16策略模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "Context.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	Context *con =[Context new];
	StrategyA *a =[StrategyA new];
	con.obj = a;
	[con opertion];
	
	StrategyB *b=[StrategyB new];
	con.obj = b;
	[con opertion];
	NSMutableArray
}


@end
