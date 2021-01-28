//
//  KCPerson.m
//  004---线程通讯
//
//  Created by Cooci on 2018/8/26.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "KCPerson.h"

@interface KCPerson()<NSMachPortDelegate>
@property (nonatomic, strong) NSPort *vcPort;
@property (nonatomic, strong) NSPort *myPort;
@end

@implementation KCPerson


- (void)personLaunchThreadWithPort:(NSPort *)port{
    
    NSLog(@"VC 响应了Person里面");
    @autoreleasepool {
        //1. 保存主线程传入的port
        self.vcPort = port;
        //2. 设置子线程名字
        [[NSThread currentThread] setName:@"KCPersonThread"];
        //3. 开启runloop
        [[NSRunLoop currentRunLoop] run];
        //4. 创建自己port
        self.myPort = [NSMachPort port];
        //5. 设置port的代理回调对象
        self.myPort.delegate = self;
		/// 重要！！！
		/// 监听port放在主线程和子线程都能完成监听
		[[NSRunLoop currentRunLoop] addPort:self.myPort forMode:NSRunLoopCommonModes];

        //6. 完成向主线程port发送消息
        [self sendPortMessage];
    }
}


/**
 *   完成向主线程发送port消息
 */

static int count = 0;
- (void)sendPortMessage {
 
	if (count > 2) {
		count = 0;
		return;
	}
	count ++;
	
    NSData *data1 = [@"Gavin" dataUsingEncoding:NSUTF8StringEncoding];
    NSData *data2 = [@"Cooci" dataUsingEncoding:NSUTF8StringEncoding];

    NSMutableArray *array  =[[NSMutableArray alloc]initWithArray:@[data1,self.myPort]];
    // 发送消息到VC的主线程
    // 第一个参数：发送时间。
    // msgid 消息标识。
    // components，发送消息附带参数。
    // reserved：为头部预留的字节数
    [self.vcPort sendBeforeDate:[NSDate date]
                          msgid:10086
                     components:array
                           from:self.myPort
                       reserved:0];
    
}

#pragma mark - NSMachPortDelegate

- (void)handlePortMessage:(NSPortMessage *)message{
    
    NSLog(@"person收到信息当前线程：%@",[NSThread currentThread].name);


	id c = [message valueForKey:@"components"];
	id p = [message valueForKey:@"receivePort"];
	id sp = [message valueForKey:@"sendPort"];
	id mid =[message valueForKey:@"msgid"];
	
    NSLog(@"from vc components：%@ rPort:%@ sport:%@ id:%@",c,p,sp,mid);
	[self sendPortMessage];
}


@end
