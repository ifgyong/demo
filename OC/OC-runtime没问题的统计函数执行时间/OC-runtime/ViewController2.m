//
//  ViewController2.m
//  OC-runtime
//
//  Created by Charlie on 2019/8/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"%p",&self);
	self.view.backgroundColor = [UIColor redColor];
	sleep(rand()%4);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	[self dismissViewControllerAnimated:true completion:nil];
}

@end
