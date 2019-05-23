//
//  MementoObj.m
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "MementoObj.h"

@implementation MementoObj
+ (instancetype)MementoObj:(NSString *)state{
    MementoObj *obj=[[MementoObj alloc]init];
    obj.state = state;
    return obj;
}
- (NSString *)getState{
    return _state;
}
@end

@implementation Originator

- (MementoObj *)saveMement{
    return  [MementoObj MementoObj:self.stateStr];
}
- (void )getMementState:(MementoObj *)obj{
    _stateStr = [obj getState];
}

@end
@implementation CareTaker

-(NSMutableArray <MementoObj *>*)list{
    if (_list == nil) {
        _list=[NSMutableArray array];
    }
    return _list;
}
- (void)add:(MementoObj *)obj{
    [self.list addObject:obj];
}
- (MementoObj *)get:(NSInteger)index{
    if (index < self.list.count) {
        return [self.list objectAtIndex:index];
    }
    return nil;
}

@end

