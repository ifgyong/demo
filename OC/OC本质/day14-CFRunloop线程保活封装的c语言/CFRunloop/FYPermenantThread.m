//
//  FYPermenantThread.m
//  CFRunloop
//
//  Created by fgy on 2019/7/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPermenantThread.h"
@interface FYThread:NSThread
@end
@implementation FYThread
-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
@interface FYPermenantThread()
{
    
}
@property (nonatomic,strong)FYThread *thread;
@property (nonatomic,assign) BOOL isStop;
@end


@implementation FYPermenantThread
-(instancetype)init{
    if (self=[super init]) {
        self.isStop = NO;
        __weak typeof(self) __weakSelf = self;
        self.thread=[[FYThread alloc]initWithBlock:^{
            
            CFRunLoopSourceContext context = {0};//初始化 上下文 结构体
            //创建source
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            //添加source
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            CFRelease(source);
            
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
            //上一句 或者使用下边的代码都一样
//            while (__weakSelf && __weakSelf.isStop == NO) {
//                //运行一次runloop
//                CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, true);
//            }
        }];
    }
    return self;
}
- (void)run{
    if (self.thread) {
        [self.thread start];
    }else{
        
    }
}
- (void)stop{
    if (self.thread == nil) {
        return;
    }
    [self performSelector:@selector(_stop) onThread:self.thread withObject:nil waitUntilDone:NO];
}
- (void)_stop{
    self.isStop = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}
- (void)exceTaskWithBlock:(dispatch_block_t)block{
    if (self.thread && block) {
        [self performSelector:@selector(__exceTaskWithBlock:)
                     onThread:self.thread
                   withObject:block
                waitUntilDone:NO];
    }
}
- (void)__exceTaskWithBlock:(dispatch_block_t)block{
    block();
}
- (void)exceTaskWithTarget:(id)target action:(SEL)action obj:(id)obj{
    if (target && action &&self.thread) {
        [target performSelector:action onThread:self.thread withObject:obj waitUntilDone:NO];
    }
}
@end
