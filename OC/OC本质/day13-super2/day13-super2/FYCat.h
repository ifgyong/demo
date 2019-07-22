//
//  FYCat.h
//  day13-super2
//
//  Created by Charlie on 2019/7/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYCat : NSObject
@property (nonatomic,copy) NSString * name;
@property (nonatomic,assign) int  age;

- (void)run;
@end

NS_ASSUME_NONNULL_END
