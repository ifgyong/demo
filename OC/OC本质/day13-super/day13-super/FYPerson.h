//
//  FYPerson.h
//  day13-super
//
//  Created by fgy on 2019/7/21.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYPerson : NSObject
@property (nonatomic,copy) NSString *name;
- (int)age;
-(void)test;
@end

NS_ASSUME_NONNULL_END
