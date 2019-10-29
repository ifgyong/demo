//
//  UIViewController+interactive.h
//  iOSDemo
//
//  Created by 李 on 2019/1/24.
//  Copyright © 2019 yangkun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (interactive)

- (void)fy_beforeViewDidLoad;
- (void)fy_afterViewDidLoad;

- (void)fy_beforeViewWillAppear;
- (void)fy_afterViewWillAppear;

- (void)fy_beforeViewDidAppear;
- (void)fy_afterViewDidAppear;

- (void)fy_beforeViewWillDisappear;
- (void)fy_afterViewWillDisappear;

//viewDidDisappear
- (void)fy_beforeViewDidDisappear;
- (void)fy_afterViewDidDisappear;

@end

NS_ASSUME_NONNULL_END
