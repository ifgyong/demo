//
//  Person.h
//  SimpleUnitTests
//
//  Created by fgy on 2019/4/16.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
@public
    NSString *publicName;
@private
    NSString *privateName;
@protected
    NSString * protectedName;
    @package
    NSString *packageName;
}
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,copy) NSString *name;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
@interface Person2 : Person
@end

NS_ASSUME_NONNULL_END
