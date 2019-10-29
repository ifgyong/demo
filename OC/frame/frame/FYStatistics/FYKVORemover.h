//
//  FYKVORemover.h
//  VCStatistics
//
//  Created by Charlie on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYKVOObserver.h"
NS_ASSUME_NONNULL_BEGIN

@interface FYKVORemover : NSObject
@property (nonatomic, unsafe_unretained) id target;
@property (nonatomic, copy) NSString *keyPath;
@end

NS_ASSUME_NONNULL_END
