//
//  ViewController.m
//  day09-block-nsobject
//
//  Created by Charlie on 2019/7/10.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	FYPerson *person = [[FYPerson alloc]init];
	person.age = 10;
	__weak typeof(person) __weakPerson = person;
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		NSLog(@"---%d",__weakPerson.age);
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			NSLog(@"---%d",person.age);
		});
	});
}

@end
