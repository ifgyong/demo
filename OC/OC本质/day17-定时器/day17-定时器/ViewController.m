	//
//  ViewController.m
//  day17-定时器
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYTimerTarget.h"
#import "FYTimer.h"
#import "FYDisplayLink.h"
#import "FYProxy.h"

@interface ViewController ()
@property (nonatomic,strong) CADisplayLink *link;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	FYTimerTarget *obj =[FYTimerTarget new];
	obj.target = self;
	
//	FYProxy *proxy=[FYProxy proxyWithTarget:self];
//	self.link = [CADisplayLink displayLinkWithTarget:obj selector:@selector(test)];
//	[self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
//	self.timer = [NSTimer timerWithTimeInterval:1.0f
//										target:obj
//									   selector:@selector(test)
//									   userInfo:nil
//										repeats:YES];
	self.timer=[NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
		NSLog(@"123");
	}];
	[[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
	[self.timer setFireDate:[NSDate distantPast]];
	
//	timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//	dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
//	dispatch_source_set_event_handler(timer, ^{
//		@synchronized (self) {
//			NSLog(@"FPS:%d",second);
//			second = 0;
//		}
//	});
//	dispatch_resume(timer);
	
}
dispatch_source_t timer;
static int second;
CFAbsoluteTime absoluteTime;
- (void)test{
	
	@synchronized (self) {
		second += 1;
	}
	NSLog(@"%s",__func__);
}
- (void)dealloc{
	[self.timer invalidate];
	[self.link invalidate];
	if (timer) {
		dispatch_source_cancel(timer);
	}
	NSLog(@"%s",__func__);
}

@end
