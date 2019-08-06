//
//  FYNewsViewModel.m
//  day18-MVC-Apple
//
//  Created by Charlie on 2019/8/6.
//  Copyright © 2019 test. All rights reserved.
//

#import "FYNewsViewModel.h"
@interface FYNewsViewModel()<FYAppleViewProtocol>


@end
@implementation FYNewsViewModel
- (void)setup{
	FYAppleView * view =[[FYAppleView alloc]initWithFrame:CGRectMake(200, 200, 100, 30)];
	FYItemModel *item=[[FYItemModel alloc]init];
	item.name = @"校长来了";
	item.bgColor = [UIColor redColor];
	view.model = item;
	[self.vc.view addSubview:view];
}
- (void)FYAppleViewDidClick:(FYAppleView *)view{
	NSLog(@"点击了我");
}
@end
