//
//  Singleton.h
//  test
//
//  Created by Charlie on 2019/5/20.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject
//禁用初始化函数
- (instancetype)init NS_UNAVAILABLE;
//获取唯一可用的对象
+ (id)share;

- (void)showMessage;
@end

NS_ASSUME_NONNULL_END
