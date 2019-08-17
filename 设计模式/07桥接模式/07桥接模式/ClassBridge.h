//
//  ClassBridge.h
//  07桥接模式
//
//  Created by fgy on 2019/8/17.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClassBridge : NSObject

@end
@class Implementor;
@protocol Abstraction <NSObject>

+ (void)operation;

@end

@protocol AbstractionSon <Abstraction>

+ (void)refinedAbstraction:(Implementor*)obj;

@end

//抽象出来的协议(抽闲类)
@protocol Implementor <NSObject>

- (void)operationImp;

@end
//具体实现类
@interface ImplementorA : NSObject <Implementor>

@end

@interface ImplementorB : NSObject <Implementor>

@end
NS_ASSUME_NONNULL_END
