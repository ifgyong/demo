//
//  FYNodeMap.h
//  VCStatistics
//
//  Created by fgy on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FYNodeMapType) {
    FYNodeMapTypeReplaced = 0,
    FYNodeMapTypeExchange = 1,
};

@interface FYNodeMap : NSObject
@property (nonatomic,assign) SEL __nonnull selName;
@property (nonatomic,assign) SEL __nonnull toSelName;

@property (nonatomic,assign) IMP __nonnull imp;
@property (nonatomic,copy) NSString * __nonnull clsName;
@property (nonatomic) const char * _Nullable type;
@property (nonatomic,strong) FYNodeMap * _Nullable next;
@property (nonatomic,assign) FYNodeMapType tp;

- (instancetype)initWith:(SEL)selName
                     imp:(IMP)imp
                 clsName:(NSString *)clsName
                   types:(const char *)types
                    next:(FYNodeMap * _Nullable)next
				 mapType:(FYNodeMapType)tp
				   toSEL:(SEL)toSEL;
@end

NS_ASSUME_NONNULL_END
