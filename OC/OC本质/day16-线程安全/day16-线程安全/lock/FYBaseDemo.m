//
//  FYBaseDemo.m
//  day16-线程安全
//
//  Created by fgy on 2019/7/25.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYBaseDemo.h"

@implementation FYBaseDemo
- (void)__saleTicket{
    NSInteger oldCount = self.ticketsCount;
    sleep(.2f);
    oldCount --;
    self.ticketsCount = oldCount;
    printf("还剩%ld张票- %s \n",(long)oldCount,[NSThread currentThread].description.UTF8String);
}
- (void)ticketTest{
    self.ticketsCount = 15;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self __saleTicket];
        }
    });
}
- (void)moneyTest{
    self.money = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self __saveMonery];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self __getMonery];
        }
    });
    
}
- (void)__saveMonery{
    NSInteger old = self.money;
    sleep(.2);
    old += 50;
    self.money = old;
    printf("存50元，剩下%ld - %s \n",self.money,[NSThread currentThread].description.UTF8String);
}
-(void)__getMonery{
    NSInteger old = self.money;
    sleep(.2);
    old -= 50;
    self.money = old;
    printf("取50元，剩下%ld - %s \n",self.money,[NSThread currentThread].description.UTF8String);
}


@end
