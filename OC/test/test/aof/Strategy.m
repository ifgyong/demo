//
//  Strategy.m
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Strategy.h"

@implementation Strategy
- (NSInteger)doOperetation:(NSInteger)n1 and:(NSInteger)n2{return 0;}
@end
@implementation Opertation


-(NSInteger)doOperetation:(NSInteger)n1 and:(NSInteger)n2{
    return n1 + n2;
}
@end
@implementation OperationMultiply
- (NSInteger)doOperetation:(NSInteger)n1 and:(NSInteger)n2{
    return n1 * n2;
}
@end
@implementation  Context_1 : NSObject
+ (instancetype)Context_1:(Strategy *)str{
    Context_1 *context = [[Context_1 alloc]init];
    context.strate = str;
    return context;
}
- (NSInteger)exce:(NSInteger)n1 and:(NSInteger)n2{
    return [_strate doOperetation:n1 and:n2];
}

@end
