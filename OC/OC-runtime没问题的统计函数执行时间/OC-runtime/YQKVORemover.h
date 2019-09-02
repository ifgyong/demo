//
//  YQKVORemover.h
//  iOSDemo
//
//  Created by 李 on 2019/1/24.
//  Copyright © 2019 yangkun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YQKVORemover : NSObject

@property (nonatomic, unsafe_unretained) id target;
@property (nonatomic, copy) NSString *keyPath;

@end

NS_ASSUME_NONNULL_END
