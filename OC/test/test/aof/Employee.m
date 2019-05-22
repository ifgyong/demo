//
//  Employee.m
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Employee.h"

@implementation Employee
- (instancetype)initWithName:(NSString *)name dept:(NSString *)dept sal:(int)sal{
    self.name = name;
    self.dept = dept;
    self.sal = sal;
    return self;
}
-(NSMutableArray <Employee*>*)subordinates{
    if (_subordinates == nil) {
        _subordinates = [NSMutableArray array];
    }
    return _subordinates;
}
- (void)add:(Employee *)e{
    [self.subordinates addObject:e];
}
- (void)remove:(Employee *)e{
    [self.subordinates removeObject:e];
}
- (NSString *)description{
    return [NSString stringWithFormat:@"Employee:[Name:%@,dept:%@,sal:%d",self.name,self.dept,_sal];
}
@end
