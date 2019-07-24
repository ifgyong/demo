//
//  ViewController.m
//  day15-GCD-死锁问题
//
//  Created by fgy on 2019/7/23.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}
- (void)test{
    //DISPATCH_QUEUE_CONCURRENT 并行
    //SERIAL 串行
    
    /*
     1.当前队列同步添加同步人任务会产生死锁
     2.当前队列异步添加任务不产生死锁
     3.向其他队列添加同步任务不会产生死锁
     */
    /*
     主队列 异步 添加任务不会产生新线程
     新建并发队列 异步添加会产生新线程并发执行任务，唯一一个并发，同时执行
     新建串行队列 有产生新线程能力，串行执行任务
     */
//    dispatch_queue_t qt = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
////    qt = dispatch_get_main_queue();
//    NSLog(@"1");
//    dispatch_async(qt, ^{
//        NSLog(@"2--");
//    });
//    dispatch_sync(qt, ^{
//        NSLog(@"2");
//    });
//    NSLog(@"3");
	dispatch_queue_t main_queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	dispatch_sync(main_queue, ^{
		NSLog(@"3");
	});
}

@end
