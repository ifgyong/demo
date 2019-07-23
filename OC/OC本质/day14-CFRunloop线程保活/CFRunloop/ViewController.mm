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
	self.thread=[[FYThread alloc]initWithTarget:self selector:@selector(test) object:nil];
	_thread.name = @"test thread";
	[_thread start];
}
- (void)test {
	[[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
	//获取obs
	NSLog(@"%@",[NSThread currentThread]);
	NSLog(@"--start--");
	/*
	 If no input sources or timers are attached to the run loop, this method exits immediately; otherwise, it runs the receiver in the NSDefaultRunLoopMode by repeatedly invoking runMode:beforeDate:. In other words, this method effectively begins an infinite loop that processes data from the run loop’s input sources and timers.
	 */
	self.shouldKeepRunning = YES;//默认运行
	NSRunLoop *theRL = [NSRunLoop currentRunLoop];
	while (_shouldKeepRunning && [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
	NSLog(@"--end--");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	NSLog(@"%s",__func__);
	[self performSelector:@selector(alive) onThread:self.thread withObject:nil waitUntilDone:NO];
	NSLog(@"执行完毕了子线程");//不执行 因为子线程保活了 不会执行完毕
}
//返回上页
- (IBAction)popVC:(id)sender {
	self.shouldKeepRunning = NO;
	[self performSelector:@selector(stop) onThread:self.thread withObject:nil waitUntilDone:NO];
}
//测试子线程是否还活着
- (void)alive{
	NSLog(@"我还活着呢->%@",[NSThread currentThread]);
}
//停止子线程线程
- (void)stop{
	CFRunLoopStop(CFRunLoopGetCurrent());
	NSLog(@"%s",__func__);
	[self performSelectorOnMainThread:@selector(pop) withObject:nil waitUntilDone:NO];
}
- (void)pop{
	[self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc{
	NSLog(@"%s",__func__);
}
@end
