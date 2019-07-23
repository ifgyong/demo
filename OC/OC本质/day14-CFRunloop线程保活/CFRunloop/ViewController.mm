//
//  ViewController.m
//  CFRunloop
//
//  Created by Charlie on 2019/7/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYThread.h"

@interface ViewController ()
@property (nonatomic,strong) FYThread *thread;
@property (nonatomic,assign) BOOL shouldKeepRunning;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    __weak typeof(self) __weakSelf = self;
    self.thread = [[FYThread alloc]initWithBlock:^{
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        //获取obs
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"--start--");
        /*
         If no input sources or timers are attached to the run loop, this method exits immediately; otherwise, it runs the receiver in the NSDefaultRunLoopMode by repeatedly invoking runMode:beforeDate:. In other words, this method effectively begins an infinite loop that processes data from the run loop’s input sources and timers.
         */
        __weakSelf.shouldKeepRunning = YES;//默认运行
        NSRunLoop *theRL = [NSRunLoop currentRunLoop];
        while (__weakSelf&&__weakSelf.shouldKeepRunning ){
            [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        };
        NSLog(@"--end--");
    }];
	_thread.name = @"test thread";
	[_thread start];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	NSLog(@"%s",__func__);
	[self performSelector:@selector(alive) onThread:self.thread withObject:nil waitUntilDone:NO];
	NSLog(@"执行完毕了子线程");//不执行 因为子线程保活了 不会执行完毕
}
//返回上页
- (IBAction)popVC:(id)sender {
	
	
}
//测试子线程是否还活着
- (void)alive{
	NSLog(@"我还活着呢->%@",[NSThread currentThread]);
}
- (void)pop{
    [self.navigationController popViewControllerAnimated:YES];
}
//停止子线程线程
- (void)stop{
    if (self.thread == nil) {
        return;
    }
	NSLog(@"%s",__func__);
    [self performSelector:@selector(stopThread) onThread:self.thread withObject:nil waitUntilDone:NO];
}
- (void)stopThread{
    self.shouldKeepRunning = NO;
    CFRunLoopStop(CFRunLoopGetCurrent());
}

- (void)dealloc{
    [self stop];
	NSLog(@"%s",__func__);
}
@end
