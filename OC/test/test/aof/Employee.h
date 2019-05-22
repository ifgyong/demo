//
//  Employee.h
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *dept;
@property (nonatomic,assign) int sal;
@property (nonatomic,strong)NSMutableArray <Employee*>*subordinates;



- (instancetype)initWithName:(NSString *)name dept:(NSString *)dept sal:(int)sal;

- (void)add:(Employee *)e;
- (void)remove:(Employee *)e;


@end

NS_ASSUME_NONNULL_END
