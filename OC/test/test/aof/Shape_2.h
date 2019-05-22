//
//  Shape_2.h
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ShapeProtocol <NSObject>
- (void)draw;
@end

@interface Circle_3 : NSObject<ShapeProtocol>

@end
@interface Rectangle_3 : NSObject<ShapeProtocol>

@end

@interface ShapeDecorator : NSObject

@property (nonatomic,strong) id<ShapeProtocol>obj;
+ (instancetype)initWith:(id)obj;
- (void)draw;

@end


@interface Shape_3 : ShapeDecorator

@end

NS_ASSUME_NONNULL_END
