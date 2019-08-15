//
//  Component.h
//  08装饰模式
//
//  Created by fgy on 2019/8/15.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//定义了协议
@protocol ComponentProtocol <NSObject>
- (void)opertion;
@end
//实现协议的类
@interface ComponentA : NSObject<ComponentProtocol>
@end
@interface ComponentB : NSObject<ComponentProtocol>
@end

//继承ComponentA的子类
@interface Component : ComponentA
- (void)addMethod;
@end

NS_ASSUME_NONNULL_END
