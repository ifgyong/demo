//
//  ViewController.m
//  runtime_demo
//
//  Created by fgy on 2019/4/18.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"
struct NSObject_IMPL {
    Class isa;
};
struct Student_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _age;
    int _no;
    NSString *_name;
};
@interface Student : NSObject{
@public
    int _age;
    int _no;
}
@property NSString *name;
- (void)aa;
@end
@implementation Student
- (void)aa{
    
}
@end
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"1",@"key1",nil];
    NSLog(@"d:%@",dic);
    
}

@end
