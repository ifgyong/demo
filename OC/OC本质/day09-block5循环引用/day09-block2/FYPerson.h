//
//  FYPerson.h
//  day09-block2
//
//  Created by Charlie on 2019/7/11.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef   void (^FYBlock)(void);
@interface FYPerson : NSObject

@property (nonatomic,copy) FYBlock blcok;
-(void)test;
@end

NS_ASSUME_NONNULL_END
