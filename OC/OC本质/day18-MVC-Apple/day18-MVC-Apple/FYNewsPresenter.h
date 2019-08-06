//
//  FYNewsPresenter.h
//  day18-MVC-Apple
//
//  Created by Charlie on 2019/8/6.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FYAppleView.h"
#import "FYItemModel.h"


NS_ASSUME_NONNULL_BEGIN
//MVP
@interface FYNewsPresenter : NSObject

@property (nonatomic,weak) UIViewController *vc;
//初始化
- (void)setup;
@end

NS_ASSUME_NONNULL_END
