//
//  SubjectOb.h
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SubjectOb;

@protocol ValueChangeProtocol <NSObject>

- (void)didChange;

@end


@interface SubjectOb : NSObject
@property (nonatomic,strong) NSMutableArray <NSObject *>*list;
@property (nonatomic,assign)NSInteger state;
- (void)attach:(NSObject *)obj;
- (void)notifyAllObj;
@end

NS_ASSUME_NONNULL_END
