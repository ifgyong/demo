//
//  FYItemModel.h
//  day18-MVC-Apple
//
//  Created by fgy on 2019/8/5.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYItemModel : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) UIColor *bgColor;

@end

NS_ASSUME_NONNULL_END
