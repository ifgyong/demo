//
//  FYAppleView.h
//  day18-MVC-Apple
//
//  Created by fgy on 2019/8/5.
//  Copyright © 2019 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FYAppleView,FYNewsViewModel;
@protocol FYAppleViewProtocol <NSObject>

- (void)FYAppleViewDidClick:(FYAppleView*)view;

@end

@class FYItemModel;

@interface FYAppleView : UIView
@property (nonatomic,strong,readonly) UILabel *nameLabel;

@property (nonatomic,weak) id<FYAppleViewProtocol> delegate;
@property (nonatomic,weak) FYNewsViewModel *viewModel;

@property (nonatomic,strong) FYItemModel *model;
@end

NS_ASSUME_NONNULL_END
