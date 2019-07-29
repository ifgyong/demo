//
//  FYBaseDemo.m
//  day16-线程安全
//
//  Created by fgy on 2019/7/25.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYBaseDemo.h"

@implementation FYBaseDemo
extern float sleepTime;
- (void)__saleTicket{
    NSInteger oldCount = self.ticketsCount;
	if (isLog) {
		sleep(sleepTime);
	}
    oldCount --;
    self.ticketsCount = oldCount;
	if (isLog) {
	printf("还剩% 2ld 张票 - %s \n",(long)oldCount,[NSThread currentThread].description.UTF8String);
	}
	
}
extern bool isLog;
-(void)otherTest{}
- (void)ticketTest{
	[self __ticketTest];
}
CFAbsoluteTime time1;
CFAbsoluteTime time2;
extern NSInteger tickets;
- (void)__ticketTest{
    self.ticketsCount = tickets;
//	for (NSInteger i = 0; i < 5; i ++) {
//		[[[NSThread alloc]initWithTarget:self selector:@selector(__saleTicket) object:nil] start];
//	}
	NSInteger count = self.ticketsCount/3;
	dispatch_queue_t queue = dispatch_queue_create("tick.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
		if (time1 == 0) {
			time1 = CFAbsoluteTimeGetCurrent();
		}
        for (int i = 0; i < count; i ++) {
            [self __saleTicket];
        }
    });

    dispatch_async(queue, ^{
		if (time1 == 0) {
			time1 = CFAbsoluteTimeGetCurrent();
		}
        for (int i = 0; i < count; i ++) {
            [self __saleTicket];
        }
    });
    dispatch_async(queue, ^{
		if (time1 == 0) {
			time1 = CFAbsoluteTimeGetCurrent();
		}
        for (int i = 0; i < count; i ++) {
            [self __saleTicket];
        }
    });
	dispatch_barrier_async(queue, ^{
		CFAbsoluteTime time = CFAbsoluteTimeGetCurrent() - time1;
		printf("tick cost time:%f \n",time);
	});
}
-(void)printStackSize{
//	printf("%2ld",(long)[[NSThread currentThread] stackSize]);
}
- (void)moneyTest{
    self.money = 10000;
	dispatch_queue_t queue = dispatch_queue_create("moneyTest.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
		if (time2 == 0) {
			time2 = CFAbsoluteTimeGetCurrent();
		}
        for (int i = 0; i < 5; i ++) {
            [self __saveMonery];
        }
    });
    
    dispatch_async(queue, ^{
		if (time2 == 0) {
			time2 = CFAbsoluteTimeGetCurrent();
		}
        for (int i = 0; i < 5; i ++) {
            [self __getMonery];
        }
    });
	dispatch_barrier_async(queue, ^{
		CFAbsoluteTime time = CFAbsoluteTimeGetCurrent() - time2;
		printf("moneyTest cost time:%f",time);
	});
}
- (void)__saveMonery{
    NSInteger old = self.money;
	if (isLog) {
		sleep(sleepTime);
	}
    old += 50;
    self.money = old;
	if (isLog) {
		printf("存50元，剩下%2ld元 - %s \n",self.money,[NSThread currentThread].description.UTF8String);
	}
}
-(void)__getMonery{
    NSInteger old = self.money;
	if (isLog) {
		sleep(sleepTime);
	}
    old -= 50;
    self.money = old;
	if (isLog) {
		printf("取50元，剩下%2ld元 - %s \n",self.money,[NSThread currentThread].description.UTF8String);
	}
}


@end
