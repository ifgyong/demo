//
//  FYNodeAdpter.h
//  VCStatistics
//
//  Created by fgy on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FYNodeManger.h"
@class FYNodeMap;

NS_ASSUME_NONNULL_BEGIN

@interface FYNodeAdpter : NSObject

@property (nonatomic,strong) FYNodeMap* top;
@property (nonatomic,strong) FYNodeMap* tail;

- (void)append:(FYNodeMap* )node;
@end

NS_ASSUME_NONNULL_END
