//
//  Copy_item.h
//  test
//
//  Created by Charlie on 2019/5/20.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN




@interface ShapeCopy : NSObject
@property (nonatomic,copy) NSString * name;
@property (nonatomic,assign) int  age;
- (void)draw;
@end


@interface RectangleCopy : ShapeCopy
@end
@interface SquareCopy : ShapeCopy
@end


@interface ShapeCache : NSObject

@property (nonatomic,strong) NSMutableDictionary  *dic;
- (void)loadCache;
- (ShapeCopy *)getShape:(NSString *)name;
@end


@interface Copy_item : NSObject

@end
NS_ASSUME_NONNULL_END
