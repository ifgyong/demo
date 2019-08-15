//
//  Builder.h
//  04建造者模式
//
//  Created by Charlie on 2019/8/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Builder <NSObject>
@optional
- (void)buildPartA;
- (void)buildPartB;
- (void)buildPartC;
- (instancetype)getResult;
@end

@interface BuilderA : NSObject<Builder>
- (void)buildPartA;
@end
@interface BuilderB : NSObject<Builder>
- (void)buildPartB;
@end


@interface Builder : NSObject
- (id)constuct;//加工
- (void)setBuilder:(id<Builder>)bd;
@end

NS_ASSUME_NONNULL_END
