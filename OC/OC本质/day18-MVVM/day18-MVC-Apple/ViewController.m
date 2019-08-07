//
//  ViewController.m
//  day18-MVC-Apple
//
//  Created by fgy on 2019/8/5.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"
#import "FYAppleView.h"
#import "FYItemModel.h"
#import "FYNewsViewModel.h"

@interface ViewController ()
@property (nonatomic,strong) FYNewsViewModel *viewmodel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//MVP
	self.viewmodel = [[FYNewsViewModel alloc]initWithController:self];
}

@end
