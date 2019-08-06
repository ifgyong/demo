//
//  FYNewsViewModel.h
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

@interface FYNewsViewModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) UIColor *bgColor;

@property (nonatomic,weak) UIViewController *vc;

- (instancetype)initWithController:(UIViewController *)vc;
@end

NS_ASSUME_NONNULL_END
