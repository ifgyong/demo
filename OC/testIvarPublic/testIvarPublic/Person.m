//
//  Person.m
//  SimpleUnitTests
//
//  Created by fgy on 2019/4/16.
//  Copyright © 2019 test. All rights reserved.
//

#import "Person.h"

@interface Person ()

@end

@implementation Person
+ (void)load{
    printf("\nPerson %s",__FUNCTION__);
}
+ (void) initialize{
    printf("\nPerson %s",__FUNCTION__);
}
- (void)say{
    printf("\nPerson %s",__FUNCTION__);
}
- (instancetype)init{
    self = [super init];
    if (self) {
        self->privateName = @"privateName";
        self->protectedName = @"protectedName";
        self->packageName = @"packageName";
        self->publicName = @"publicName";
    }
    return self;
}
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

@implementation Person2
+ (void)load{
    printf("\nPerson2 %s",__FUNCTION__);
}
+ (void) initialize{
    if (self == [Person2 self]) {
        printf("\nPerson2 %s",__FUNCTION__);
    }
}
- (void)good{
//    
//    self->protectedName = @"1";
//    self->packageName = @"2";
//    self->publicName = @"3";
//    self->privateName = @"4"; //报错
//    
//    Person *p=[Person new];
//    p->protectedName = @"1";
//    p->packageName = @"2";
//    p->publicName = @"3";
//    p->privateName = @"4";//报错
}
@end


