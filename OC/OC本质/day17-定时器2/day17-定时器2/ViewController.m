//
//  ViewController.m
//  day17-定时器2
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYTimer.h"

@interface ViewController ()
@property (nonatomic,strong) dispatch_source_t timer;
@end

@implementation ViewController
NSString * key ;
- (void)viewDidLoad {
	[super viewDidLoad];
////    //主队列
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    //创建定时器
//    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    //设置启动时间
//    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 1*NSEC_PER_SEC, 0);
//    //设定回调
//    dispatch_source_set_event_handler(_timer, ^{
//        NSLog(@"123");
//    });
//    dispatch_resume(_timer);
//    dispatch_source_set_event_handler_f(_timer, dispatch_function_A);
    
//    key = [FYTimer exeTask:^{
//        NSLog(@"123");
//    } start:1 interval:1 repeat:YES async:NO];
	key = [FYTimer exeTask:self sel:@selector(test) start:0 interval:1 repeat:YES async:YES];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	[FYTimer exeCancelTask:key];
    NSLog(@"%s",__func__);
}
-(void)test{
	NSLog(@"%@",[NSThread currentThread]);
}
void dispatch_function_A(void * p){
	NSLog(@"%@",[NSThread currentThread]);
}
@end
