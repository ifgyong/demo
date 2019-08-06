//
//  ViewController.m
//  day18-分层设计
//
//  Created by Charlie on 2019/8/6.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYDBPool.h"
#import "FYHttpPool.h"
#import "FYNewsService.h"

@interface ViewController ()
@property (nonatomic,strong) FYDBPool *db;
@property (nonatomic,strong) FYHttpPool *http;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.db=[FYDBPool new];
	self.http=[FYHttpPool new];
	
	
	//当有业务层
	[[FYNewsService new] loadNewsWithInfo:nil success:^(NSArray * _Nonnull) {
		
	} fail:^{
		
	}];
	//当没有有业务层
	
	[self.db loadNewsWithInfo:@{} success:^(NSArray * _Nonnull ret) {
		if ([ret count]) {
			NSLog(@"数据获取成功");
		}else{
			[self.http loadNewsWithInfo:@{} success:^(NSArray * _Nonnull ret) {
				NSLog(@"数据获取成功");
			} fail:^{
				NSLog(@"数据获取失败");
			}];
		}
	} fail:^{
		[self.http loadNewsWithInfo:@{} success:^(NSArray * _Nonnull ret) {
			NSLog(@"数据获取成功");
		} fail:^{
			NSLog(@"数据获取失败");
		}];
	}];
	
}


@end
