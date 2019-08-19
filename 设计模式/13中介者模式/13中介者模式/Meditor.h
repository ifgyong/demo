//
//  Meditor.h
//  13中介者模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN




@interface Meditor : NSObject

- (void)registerObj:(NSString *)key;

- (void)sendMsg:(NSString *)key msg:(NSString *)msg;
@end

@protocol ColleagueProtocol <NSObject>

- (void)sendmsg:(NSString *)msg;

@end

@interface ColleagueA : NSObject<ColleagueProtocol>

@end
@interface ColleagueB : NSObject<ColleagueProtocol>

@end

NS_ASSUME_NONNULL_END
