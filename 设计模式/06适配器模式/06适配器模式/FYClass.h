//
//  FYClass.h
//  06适配器模式
//
//  Created by fgy on 2019/8/16.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Adaptee : NSObject
- (void)specificRequest;
@end

@interface Adapter : NSObject
@property (nonatomic,strong) Adaptee *adaptee;

+ (instancetype)initWithAdaptee:(Adaptee *)obj;
- (void)request;
@end

@interface FYClass : NSObject

@end



NS_ASSUME_NONNULL_END
