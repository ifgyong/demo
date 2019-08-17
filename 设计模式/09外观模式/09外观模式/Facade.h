//
//  Facade.h
//  09外观模式
//
//  Created by fgy on 2019/8/17.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//子系统角色
@interface SystemA : NSObject
- (void)run;
@end
//子系统角色
@interface SystemB : NSObject
- (void)eat;
@end
//子系统角色
@interface SystemC : NSObject
- (void)play;
@end
//外观角色
@interface Facade : NSObject
@property (nonatomic,strong) SystemA *a;
@property (nonatomic,strong) SystemB *b;
@property (nonatomic,strong) SystemC *c;
@end

NS_ASSUME_NONNULL_END
