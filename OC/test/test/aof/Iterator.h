//
//  Iterator.h
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Iterator <NSObject>
- (BOOL)hasNext;
- (id)next;
@end
@protocol  Container <NSObject>
- (id<Iterator>)getIterator;
@end


@interface NameRepository : NSObject<Container>

@end
@interface NameIterator : NSObject<Iterator>

@end

NS_ASSUME_NONNULL_END
