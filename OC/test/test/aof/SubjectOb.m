//
//  SubjectOb.m
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "SubjectOb.h"

@implementation SubjectOb
- (void)attach:(NSObject *)obj{
    if (self.list == nil) {
        self.list=[NSMutableArray array];
    }
    [self.list addObject:obj];
}
- (void)notifyAllObj{
    for (NSObject *item in self.list) {
        if ([item conformsToProtocol:@protocol(ValueChangeProtocol)]) {
            [item performSelector:@selector(didChange)];
        };
    }
}
- (void)setState:(NSInteger)state{
    _state = state;
    [self notifyAllObj];
}
@end
