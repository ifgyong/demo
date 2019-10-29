//
//  FYNodeMap.m
//  VCStatistics
//
//  Created by fgy on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYNodeMap.h"

@implementation FYNodeMap
-(instancetype)initWith:(SEL)selName imp:(IMP)imp clsName:(NSString *)clsName types:(const char *)types next:(FYNodeMap *)next mapType:(FYNodeMapType)tp toSEL:(SEL)toSEL{
    //    self = [super init];
    if (self) {
        self.clsName = clsName;
        self.imp = imp;
        self.selName = selName;
        self.type = types;
        self.next = next;
        self.tp = tp;
		self.toSelName = toSEL;
    }
    return self;
}
@end
