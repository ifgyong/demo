//
//  Shape_4.h
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Shape4Protocl <NSObject>

- (void)draw;

@end


@interface Rectangle_4 : NSObject<Shape4Protocl>
- (void)draw;
@end
@interface Cirle_4 : NSObject<Shape4Protocl>
- (void)draw;
@end
@interface Shape_4_Maker : NSObject
@property (nonatomic,strong) id<Shape4Protocl> circle;
@property (nonatomic,strong) id<Shape4Protocl> rectangle;
+ (instancetype)initWithCircle:( id<Shape4Protocl>)circle rectang:(id<Shape4Protocl>)rectang;
- (void)drawCircle;
- (void)drawRectang;
@end
@interface Shape_4 : NSObject

@end

NS_ASSUME_NONNULL_END
