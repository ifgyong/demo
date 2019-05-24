//
//  UIViewController+add.h
//  FYRuntimeAOP
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <objc/objc.h>
#include <objc/NSObjCRuntime.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (add)
- (void)logSelf;
@end

NS_ASSUME_NONNULL_END
