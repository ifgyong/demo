//
//  ViewController.m
//  day15-面试题分析
//
//  Created by fgy on 2019/7/24.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
}
- (void)test3{
    NSThread *thread=[[NSThread alloc]initWithBlock:^{
        NSLog(@"12");
    }];
    [thread start];
    [self performSelector:@selector(test)
                 onThread:thread
               withObject:nil
            waitUntilDone:YES];
}
- (void)test1{
    dispatch_queue_t  que= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(que, ^{
        NSLog(@"1");
        // 相当于[self test];
        //        [self performSelector:@selector(test) withObject:nil];
        //定时器 是添加到runloop中的，子线程无runloop，所以添加定时器也不会执行。
        
        [self performSelector:@selector(test) withObject:nil afterDelay:.0];
        NSLog(@"3");
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
    });
}
- (void)test{
    NSLog(@"2");
}


@end
