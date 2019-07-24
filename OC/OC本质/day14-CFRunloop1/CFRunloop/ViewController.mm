//
//  ViewController.m
//  CFRunloop
//
//  Created by Charlie on 2019/7/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
	dispatch_source_t timer;
	CFRunLoopMode m;
	CFRunLoopObserverRef obs;
}
@end

@implementation ViewController
-(void)dealloc{
	NSLog(@"%s",__func__);
	CFRunLoopRemoveObserver(CFRunLoopGetMain(), obs, m);
	dispatch_source_cancel(timer);
}
- (IBAction)stop:(UIButton *)sender {
	
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
//	NSRunLoop * runloop1 = [NSRunLoop currentRunLoop];
//	NSRunLoop *mainloop1 = [NSRunLoop mainRunLoop];
//	
//	CFRunLoopRef runloop2= CFRunLoopGetCurrent();
//	CFRunLoopRef mainloop2 = CFRunLoopGetMain();
//	NSLog(@"%p %p %p %p",runloop1,mainloop1,runloop2,mainloop2);
//	NSLog(@"%@",runloop1);
	
	/***********************************************************/
	/***********************使用callback回调**********************/
	/***********************************************************/
	//获取loop
	CFRunLoopRef ref = CFRunLoopGetMain();
	//获取obs
	obs = CFRunLoopObserverCreate(kCFAllocatorDefault,kCFRunLoopAllActivities, YES, 0, callback, NULL);
	//添加监听
	m = CFRunLoopCopyCurrentMode(ref);
	CFRunLoopAddObserver(ref, obs, m);
	
	CFRelease(m);
	CFRelease(obs);
	/***********************************************************/
	/************************使用block回调***********************/
	/***********************************************************/
		//获取obs
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
	
	
	timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
	static int count = 5;
	dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
	dispatch_source_set_event_handler(timer, ^{
		NSLog(@"-------：%d \n",count++);
	});
	dispatch_resume(timer);
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
