//
//  FYTimer.h
//  day17-定时器2
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYTimer : NSObject

+ (NSString *)exeTask:(dispatch_block_t)block
		  start:(NSTimeInterval)time
	   interval:(NSTimeInterval)interval
		 repeat:(BOOL)repeat
		  async:(BOOL)async;
+ (NSString *)exeTask:(id)target
				  sel:(SEL)aciton
				start:(NSTimeInterval)time
			 interval:(NSTimeInterval)interval
			   repeat:(BOOL)repeat
				async:(BOOL)async;
+ (void)exeCancelTask:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
