//
//  Person_2.h
//  test
//
//  Created by Charlie on 2019/5/21.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person_2 : NSObject
@property (nonatomic,copy,readonly) NSString *name;
@property (nonatomic,copy,readonly) NSString *gender;
@property (nonatomic,copy,readonly) NSString *maritalStatus;

- (NSString *)getName;
- (NSString *)getGender;
- (NSString *)getMaritalStatus;
- (instancetype)initWithName:(NSString *)name gender:(NSString *)gender maritalStatus:(NSString *)maritalStatus;
@end


@protocol Criteria <NSObject>

-(NSMutableArray<Person_2 *> *)meetCriteria:(NSMutableArray<Person_2 * > *)list;


@end
//Criteria2 <NSObject>
//
//-(NSMutableArray<Person_2 *> *)meetCriteria:(NSMutableArray<Person_2  *> *)list;
//
//@end

@interface CriteriaMale : NSObject <Criteria>
- (NSMutableArray<Person_2 *> *)meetCriteria:(NSMutableArray<Person_2 *> *)list;
@end
@interface CriteriaSingle : NSObject <Criteria>
- (NSMutableArray<Person_2 *> *)meetCriteria:(NSMutableArray<Person_2 *> *)list;
@end

@interface andCriteria : NSObject <Criteria>

@property (nonatomic,strong) id<Criteria> _Nullable criteria;
@property (nonatomic,strong) id<Criteria> _Nullable otherCriteria;

- (NSMutableArray<Person_2 *> *)meetCriteria:(NSMutableArray <Person_2 *>*)list;

@end
@interface orCriteria : NSObject <Criteria>

@property (nonatomic,strong) id<Criteria> _Nullable criteria;
@property (nonatomic,strong) id<Criteria> _Nullable otherCriteria;

- (NSMutableArray<Person_2 *> *)meetCriteria:(NSMutableArray <Person_2 *>*)list;

@end
NS_ASSUME_NONNULL_END
