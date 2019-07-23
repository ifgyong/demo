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
	
//	NSRunLoop * runloop1 = [NSRunLoop currentRunLoop];
//	NSRunLoop *mainloop1 = [NSRunLoop mainRunLoop];
//	
//	CFRunLoopRef runloop2= CFRunLoopGetCurrent();
//	CFRunLoopRef mainloop2 = CFRunLoopGetMain();
//	NSLog(@"%p %p %p %p",runloop1,mainloop1,runloop2,mainloop2);
//	NSLog(@"%@",runloop1);
	
	
//	//获取loop
	CFRunLoopRef ref = CFRunLoopGetMain();
	//获取obs
	CFRunLoopObserverRef obs = CFRunLoopObserverCreate(kCFAllocatorDefault,kCFRunLoopAllActivities, YES, 0, callback, NULL);
	//添加监听
	CFRunLoopAddObserver(ref, obs, CFRunLoopCopyCurrentMode(ref));
	CFRelease(obs);
	
	//	//获取obs
//	CFRunLoopObserverRef obs= CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//		switch (activity) {
//			case kCFRunLoopEntry:{
//				CFRunLoopMode m = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
//				NSLog(@"即将进入 mode:%@",m);
//				CFRelease(m);
//				break;
//			}
//
//			case kCFRunLoopExit:
//			{
//				CFRunLoopMode m = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
//				NSLog(@"即将退出 mode:%@",m);
//				CFRelease(m);
//				break;
//			}
//			default:
//				break;
//		}
//	});
//	CFRunLoopAddObserver(CFRunLoopGetMain(), obs, kCFRunLoopCommonModes);
//	CFRelease(obs);
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
	NSLog(@"%s",__func__);
}

@end
