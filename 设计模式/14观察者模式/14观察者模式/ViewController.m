//
//  ViewController.m
//  14观察者模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,assign) int age;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	[self addObserver:self forKeyPath:@"age"
			  options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
			  context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
	NSLog(@"%@",change);
}

@end
