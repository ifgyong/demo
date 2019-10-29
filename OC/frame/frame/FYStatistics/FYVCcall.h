//
//  FYVCcall.h
//  VCStatistics
//
//  Created by Charlie on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^funcCallBack)(CFAbsoluteTime loadTime,UIViewController *kvo_self, NSString *funcName,NSString *dateString);

@interface FYVCcall : NSObject
@property (nonatomic,copy) funcCallBack callback;
+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END
