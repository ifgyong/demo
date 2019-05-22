//
//  ChatRoom.h
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class User;

@interface ChatRoom : NSObject
+ (void)showMessage:(User *)us msg:(NSString *)message;
@end



@interface User :NSObject
@property (nonatomic,copy) NSString * name;
+(instancetype)User:(NSString *)name;
- (void)sendMessage:(NSString *)message;
@end


NS_ASSUME_NONNULL_END
