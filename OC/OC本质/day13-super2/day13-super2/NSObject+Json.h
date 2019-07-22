//
//  NSObject+Json.h
//  day13-super2
//
//  Created by Charlie on 2019/7/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Json)
+ (instancetype)fy_objectWithJson:(NSDictionary *)json;
@end

NS_ASSUME_NONNULL_END
