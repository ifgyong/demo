//
//  ViewController.m
//  day10-位运算
//
//  Created by Charlie on 2019/7/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import "FYPerson.h"
#import "objc/runtime.h"

typedef enum {
	FYOne = 1,//  0b 0001
	FYTwo = 2,//  0b 0010
	FYTHree = 4,//0b 0100
	FYFour = 8,// 0b 1000
}FYOptions;

@interface ViewController ()

@end

@implementation ViewController
- (void)setOptions:(FYOptions )ops{
	if (ops &FYOne) {
		NSLog(@"FYOne is show");
	}
	if (ops &FYTwo) {
		NSLog(@"FYTwo is show");
	}
	if (ops &FYTHree) {
		NSLog(@"FYTHree is show");
	}
	if (ops &FYFour) {
		NSLog(@"FYFour is show");
	}
}
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
//	[self setOptions:FYOne|FYTwo|FYTHree];
	FYPerson *p=[[FYPerson alloc]init];
	SEL sel = @selector(test:heiht:);
	Method m1= class_getInstanceMethod(p.class, sel);
	const char *type = method_getTypeEncoding(m1);
	NSLog(@"%s",type);
	
	fy_objc_class *struct_cls = (__bridge fy_objc_class *)[p class];
	class_rw_t *tw_data = struct_cls->data();
	
	NSLog(@"----end------");
	
}


@end
