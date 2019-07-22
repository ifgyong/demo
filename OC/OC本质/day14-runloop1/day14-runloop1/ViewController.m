//
//  ViewController.m
//  day14-runloop1
//
//  Created by fgy on 2019/7/22.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSRunLoop * runloop1 = [NSRunLoop currentRunLoop];
    NSRunLoop *mainloop1 = [NSRunLoop mainRunLoop];

    CFRunLoopRef runloop2= CFRunLoopGetCurrent();
    CFRunLoopRef mainloop2 = CFRunLoopGetMain();
    NSLog(@"%p %p %p %p",runloop1,mainloop1,runloop2,mainloop2);
    NSLog(@"%@",runloop1);
    
}


@end
