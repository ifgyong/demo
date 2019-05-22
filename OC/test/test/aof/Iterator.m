//
//  Iterator.m
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Iterator.h"


@implementation NameRepository
- (id<Iterator>)getIterator{
    return [NameIterator new];
}
@end

@interface NameIterator (){
    NSArray *_names;
    int index;
}
@end
@implementation NameIterator
- (instancetype)init{
    self=[super init];
    _names = @[@"Job",@"BOb",@"Lora",@"Julie"];
    return self;
}
- (BOOL)hasNext{
    if (index < _names.count) {
        return YES;
    }else{
        return NO;
    }
}
- (id)next{
    if ([self hasNext]) {
        return _names[index++];
    }
    return nil;
}
@end
