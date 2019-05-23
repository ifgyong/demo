//
//  MementoObj.h
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN




@interface MementoObj : NSObject

@property (nonatomic,copy) NSString *state;
+ (instancetype)MementoObj:(NSString *)state;
- (NSString *)getState;
@end

@interface Originator :NSObject
@property (nonatomic,copy) NSString *stateStr;
- (MementoObj *)saveMement;
- (void )getMementState:(MementoObj *)obj;

@end

@interface CareTaker : NSObject
@property (nonatomic,strong)NSMutableArray <MementoObj *>*list;

- (void)add:(MementoObj *)obj;
- (MementoObj *)get:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
