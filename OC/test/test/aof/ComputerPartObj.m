//
//  ComputerPartObj.m
//  test
//
//  Created by Charlie on 2019/5/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ComputerPartObj.h"

@implementation ComputerPartObj

@end
@implementation ComputerPart
-(void)accept:(id<ComputerPartVisitor>)com{}
@end
@implementation Mouse
- (void)accept:(id<ComputerPartVisitor>)com{
    [com visitMouse:self];
}
@end
@implementation Computer

- (void)accept:(id<ComputerPartVisitor>)com{
    for (ComputerPart *item in self.list) {
        [item accept:com];
    }
    [com visit:self];
}
- (instancetype)init{
    self =[super init];
    self.list=[NSMutableArray array];
    [self.list addObject:[Mouse new]];
    return self;
}
@end
@implementation ComputerDisplayVisitor

- (void)visitMouse:(Mouse *)mou{
    NSLog(@"display mouse");
}
- (void)visit:(Computer *)pt{
    NSLog(@"display computer");
}

@end
