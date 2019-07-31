//
//  FYPerson.h
//  day17-copy-1
//
//  Created by Charlie on 2019/7/31.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYPerson : NSObject
@property (nonatomic,assign) int age;
@property (nonatomic,assign) int level;
@property (nonatomic,copy) NSString * name;


@end

NS_ASSUME_NONNULL_END
