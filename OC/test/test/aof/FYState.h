//
//  FYState.h
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class Context;
@protocol StateProtocol <NSObject>
- (void)doAction:(Context*)obj;
@end

@interface FYState : NSObject

@end

@interface StartState : NSObject<StateProtocol>
- (void)doAction:(Context*)obj;
- (NSString *)toString;
@end
@interface StopState : NSObject<StateProtocol>
- (void)doAction:(Context*)obj;
- (NSString *)toString;
@end

@interface Context : NSObject

@property (nonatomic) id<StateProtocol> state;


- (NSString *)toString;

@end

NS_ASSUME_NONNULL_END
