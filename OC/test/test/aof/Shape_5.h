//
//  Shape_5.h
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol Shape5Protocol <NSObject>
- (void)draw;
@end


@interface Circle_5 : NSObject <Shape5Protocol>
@property (nonatomic,assign) int x;
@property (nonatomic,assign) int y;
@property (nonatomic,assign) int radius;
@property (nonatomic,copy) NSString * color;
- (void)draw;
@end

@interface Shape_5_Factory : NSObject
@property (nonatomic,strong) NSMutableDictionary *info;
- (id<Shape5Protocol>)getShape:(NSString *)color;

@end


@interface Shape_5 : NSObject

@end

NS_ASSUME_NONNULL_END
