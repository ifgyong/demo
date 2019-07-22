//
//  ViewController.m
//  day14-方法交换
//
//  Created by Charlie on 2019/7/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "objc/runtime.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	NSMutableArray *array=[NSMutableArray array];
	id obj = nil;
	[array addObject:obj];
	array[1];
    
    NSMutableDictionary *dic=[@{} mutableCopy];
    dic [@"1"];
    [dic setObject:nil forKey:@"2"];
//    [dic setValue:nil forKey:@"12"];
    dic[nil];
}

- (IBAction)click:(id)sender {
	NSLog(@"");
}
- (IBAction)click2:(id)sender {
}

@end
