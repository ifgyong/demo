//
//  ChatRoom.m
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ChatRoom.h"

@implementation ChatRoom
+ (void)showMessage:(User *)us msg:(NSString *)message{
    NSLog(@"%@ name:%@ msg:%@",[NSDate date],us.name,message);
}
@end
@implementation User

+(instancetype)User:(NSString *)name{
    User *us =[User new];
    us.name = name;
    return us;
}
- (void)sendMessage:(NSString *)message{
    [ChatRoom showMessage:self
                      msg:message];
}

@end
