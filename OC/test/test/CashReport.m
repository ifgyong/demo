//
//  CashReport.m
//  test
//
//  Created by Charlie on 2019/5/13.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "CashReport.h"

@interface CashReport ()
{
    CFAbsoluteTime time;
}
@end

@implementation CashReport
+ (instancetype)share{
    static dispatch_once_t onceToken;
    static CashReport *cash;
    dispatch_once(&onceToken, ^{
        cash = [[CashReport alloc]init];
        [cash addRunLoop];
    });
    return cash;
}
- (void)addRunLoop{

    CFRunLoopRef loop = CFRunLoopGetMain();
    static CFAbsoluteTime stepTime = 1/60.0;
    CFRunLoopObserverRef ob =
    CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"下一个loop 开始");
                break;
            case kCFRunLoopExit:
                NSLog(@"loop 退出了");
                break;
            case kCFRunLoopAfterWaiting:
                self->time = CFAbsoluteTimeGetCurrent();
                NSLog(@"kCFRunLoop  醒来了");
                break;
            case kCFRunLoopBeforeWaiting:
            {
                CFAbsoluteTime time_wase = CFAbsoluteTimeGetCurrent() - self->time;
                if (time_wase > stepTime) {
                    NSLog(@"kCFRunLoop 干完活了,有点卡 time:%f",time_wase);
                }else{
                    NSLog(@"kCFRunLoop 干完活了 time:%f",time_wase);
                }
            }
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"kCFRunLoopBeforeTimers");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"kCFRunLoopBeforeSources");
                break;
            default:
                break;
        }
    });
    if (CFRunLoopContainsObserver(loop, ob, kCFRunLoopDefaultMode) == false) {
        CFRunLoopAddObserver(loop, ob, kCFRunLoopDefaultMode);
    }
        CFRelease(ob);
   
    
}
@end
