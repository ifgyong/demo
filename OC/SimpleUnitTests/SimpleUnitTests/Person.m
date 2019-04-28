//
//  Person.m
//  SimpleUnitTests
//
//  Created by fgy on 2019/4/16.
//  Copyright © 2019 test. All rights reserved.
//

#import "Person.h"

@implementation Person
-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        if ([dic isKindOfClass:[NSDictionary class]]&&dic.count > 0) {
            NSArray * keys = dic.allKeys;
            if ([keys containsObject:@"age"]) {
                id age = [dic objectForKey:@"age"];
                if ([age isKindOfClass:[NSNumber class]]) {
                    NSNumber *ageNumber=(NSNumber *)age;
                    self.age = ageNumber.integerValue;
                }
            }
            if ([keys containsObject:@"name"]) {
                NSString * name =[dic objectForKey:@"name"];
                if ([name isKindOfClass:[NSString class]]) {
                    self.name = name;
                }
            }
        }
    }
    return self;
}
@end
