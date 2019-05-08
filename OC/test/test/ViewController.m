//
//  ViewController.m
//  test
//
//  Created by Charlie on 2019/5/7.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *p=[[Person alloc]init];
    [p setValue:@"protectedName_set" forKey:@"protectedName"];
    NSString *protectedName = [p valueForKeyPath:@"protectedName"];

    [p setValue:@"packageName_set" forKey:@"packageName"];
    NSString *packageName = [p valueForKeyPath:@"packageName"];

    [p setValue:@"publicName_set" forKey:@"publicName"];
    NSString *publicName = [p valueForKeyPath:@"publicName"];

    [p setValue:@"privateName_set" forKey:@"privateName"];
    NSString *privateName = [p valueForKeyPath:@"privateName"];

    NSLog(@"1:%@ 2:%@ 3:%@ 4:%@",publicName,packageName,protectedName,privateName);
    
    
    Person2 *p2=[Person2 new];
    [p2 setValue:@"protectedName_set_1" forKey:@"protectedName"];
    protectedName = [p2 valueForKeyPath:@"protectedName"];
    
    [p2 setValue:@"packageName_set_1" forKey:@"packageName"];
    packageName = [p2 valueForKeyPath:@"packageName"];
    
    [p2 setValue:@"publicName_set_1" forKey:@"publicName"];
    publicName = [p2 valueForKeyPath:@"publicName"];
    
    [p2 setValue:@"privateName_set_1" forKey:@"privateName"];
    privateName = [p2 valueForKeyPath:@"privateName"];
    NSLog(@"1:%@ 2:%@ 3:%@ 4:%@",publicName,packageName,protectedName,privateName);
}


@end
