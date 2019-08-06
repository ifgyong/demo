//
//  FYNewsService.h
//  day18-分层设计
//
//  Created by Charlie on 2019/8/6.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^succcessCallback)(NSArray *);
@interface FYNewsService : NSObject

- (void)loadNewsWithInfo:(NSDictionary *)info
				 success:(succcessCallback )succblock
					fail:(dispatch_block_t)failBlock;
@end

NS_ASSUME_NONNULL_END
