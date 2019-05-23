//
//  Strategy.h
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface Strategy : NSObject
- (NSInteger)doOperetation:(NSInteger)n1 and:(NSInteger)n2;
@end


@interface Opertation : Strategy
@end
@interface OperationMultiply : Strategy

@end

@interface Context_1 : NSObject
@property (nonatomic,strong) Strategy *strate;
+ (instancetype)Context_1:(Strategy *)str;
- (NSInteger)exce:(NSInteger)n1 and:(NSInteger)n2;
@end
NS_ASSUME_NONNULL_END
