//
//  Person_2.m
//  test
//
//  Created by Charlie on 2019/5/21.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Person_2.h"

@implementation Person_2
- (instancetype)initWithName:(NSString *)name gender:(NSString *)gender maritalStatus:(NSString *)maritalStatus{
    _name = name;
    _gender = gender;
    _maritalStatus = maritalStatus;
    return self;
}
- (NSString *)getGender{
    return _gender;
}
- (NSString *)getName{
    return _name;
}
- (NSString *)getMaritalStatus{
    return _maritalStatus;
}
@end
@implementation CriteriaMale

-(NSMutableArray *)meetCriteria:(NSMutableArray *)list{
    NSMutableArray *newList=[NSMutableArray array];
    for (Person_2 *item in list) {
        if ([item.getGender.uppercaseString isEqualToString:@"MALE"]) {
            [newList addObject:item];
        }
    }
    return newList;
}
@end
@implementation CriteriaSingle

-(NSMutableArray *)meetCriteria:(NSMutableArray *)list{
    NSMutableArray *newList=[NSMutableArray array];
    for (Person_2 *item in list) {
        if ([item.getMaritalStatus.lowercaseString isEqualToString:@"single"]) {
            [newList addObject:item];
        }
    }
    return newList;
}
@end
@implementation andCriteria

- (NSMutableArray<Person_2 *> *)meetCriteria:(NSMutableArray <Person_2 *>*)list{
    NSMutableArray<Person_2 *> *newList2=[NSMutableArray array];
    [newList2 addObjectsFromArray:[self.criteria performSelector:@selector(meetCriteria:)
                                                      withObject:list]];
    return [self.otherCriteria performSelector:@selector(meetCriteria:) withObject:newList2];
}
@end
@implementation orCriteria

- (NSMutableArray<Person_2 *> *)meetCriteria:(NSMutableArray <Person_2 *>*)list{
    NSMutableArray<Person_2 *> *newList1=[NSMutableArray array];
    NSMutableArray<Person_2 *> *newList2=[NSMutableArray array];
    [newList2 addObjectsFromArray:[self.criteria performSelector:@selector(meetCriteria:)
                                                      withObject:list]];
    [newList1 addObjectsFromArray:[self.criteria performSelector:@selector(meetCriteria:)
                                                      withObject:list]];
    for (Person_2 *item in newList2) {
        if ([newList1 containsObject:item] == NO) {
            [newList1 addObject:item];
        }
    }
    return newList1;
}
@end
