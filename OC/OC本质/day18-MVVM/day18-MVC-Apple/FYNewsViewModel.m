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
- (instancetype)initWithController:(UIViewController *)vc{
    if (self =[super init]) {
        self.vc = vc;
        
        FYAppleView * view =[[FYAppleView alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
        //    view.model = item;
        view.delegate = self;
        view.viewModel = self; //建立kvo
        
        view.backgroundColor = [UIColor lightGrayColor];
        [vc.view addSubview:view];
        
        
        
        FYItemModel *item=[[FYItemModel alloc]init];
        item.name = @"校长来了";
        item.bgColor = [UIColor redColor];
        
        self.name = item.name;
        self.bgColor = item.bgColor;
    }
    return self;
}
- (void)setup{

}
- (void)FYAppleViewDidClick:(FYAppleView *)view{
	NSLog(@"点击了我");
}
@end
