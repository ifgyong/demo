//
//  ComputerPartObj.h
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class Computer;
@class Mouse;
@interface ComputerPartObj : NSObject

@end



@protocol ComputerPartVisitor <NSObject>

- (void)visit:(Computer *)pt;
- (void)visitMouse:(Mouse *)mou;

@end
@interface ComputerPart :NSObject <NSObject>
@property (nonatomic,strong)NSMutableArray *list;
- (void)accept:(id<ComputerPartVisitor>)com;
@end

@interface Mouse : ComputerPart

@end
@interface Computer : ComputerPart

@end
@interface ComputerDisplayVisitor : NSObject< ComputerPartVisitor>
- (void)visitMouse:(Mouse *)mou;
- (void)visit:(Computer *)pt;
@end
NS_ASSUME_NONNULL_END
