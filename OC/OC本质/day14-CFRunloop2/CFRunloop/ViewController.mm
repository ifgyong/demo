//
//  ViewController.m
//  CFRunloop
//
//  Created by Charlie on 2019/7/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
////	//获取loop
//	CFRunLoopRef ref = CFRunLoopGetMain();
//	//获取obs
//	CFRunLoopObserverRef obs = CFRunLoopObserverCreate(kCFAllocatorDefault,kCFRunLoopAllActivities, YES, 0, callback, NULL);
//	//添加监听
//	CFRunLoopAddObserver(ref, obs, CFRunLoopCopyCurrentMode(ref));
//	CFRelease(obs);
	
//	static int i = 0;
//	NSTimer *timer=[NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//		NSLog(@"%d",++i);
//	}];
	//NSRunLoopCommonModes 并不是一个真正的模式，它这还是一个标记
	//timer在设置为common模式下能运行
	//NSRunLoopCommonModes 能在 _commentModes中数组中的模式都可以运行
//	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];//默认的模式
//	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
	
	[[NSRunLoop currentRunLoop] addPort:[NSPort port]
								forMode:NSRunLoopCommonModes];
}
int count = 0;
void callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
	printf("- ");
	count ++;
	printf("%d",count);
	switch (activity) {
		case kCFRunLoopEntry:
			printf("即将进入 \n");
			count = 0;
			break;
		case kCFRunLoopExit:
			printf("即将退出 \n");
			break;
		case kCFRunLoopAfterWaiting:
			printf("即将从休眠中唤醒 \n");
			break;
		case kCFRunLoopBeforeTimers:
			printf("即将进入处理 timers \n");
			break;
		case kCFRunLoopBeforeSources:
			printf("即将进入 sources \n");
			break;
		case kCFRunLoopBeforeWaiting:
			printf("即将进入 休眠 \n");
			count = 0;
			break;
		default:
			break;
	}
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//	NSLog(@"%s",__func__);
}

@end
