//
//  BridgePatter.h
//  test
//
//  Created by Charlie on 2019/5/21.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BridgePatter : NSObject

@end

@interface DrawAPI : NSObject <NSObject>
- (void)drawCircle:(int)radius x:(int)x y:(int)y;
@end

@interface RedCircle : DrawAPI
- (void)drawCircle:(int)radius x:(int)x y:(int)y;
@end

@interface GreenCircle : DrawAPI
- (void)drawCircle:(int)radius x:(int)x y:(int)y;
@end

@interface Shape : NSObject
@property (nonatomic,strong)DrawAPI *api;
- (void)Shape:(DrawAPI *)api;
- (void)draw;
@end

@interface Circle_2 : Shape
@property (nonatomic,assign) int x;
@property (nonatomic,assign) int y;
@property (nonatomic,assign) int radius;
+ (instancetype)configWithRadius:(int)radius x:(int)x y:(int)y draw:(DrawAPI*)api;
- (void)draw;

@end

NS_ASSUME_NONNULL_END
