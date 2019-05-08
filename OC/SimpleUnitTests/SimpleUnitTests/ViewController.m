//
//  ViewController.m
//  SimpleUnitTests
//
//  Created by fgy on 2019/4/16.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person2 *p2=[[Person2 alloc]init];
    p2->packageName = @"packageName";
    p2->publicName = @"publicName";
    p2->protectedName = @"protectedName";
    p2->privateName = @"privateName";
}


@end
