//
//  Pattern.m
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Pattern.h"

@implementation TerminalExpression
+ (instancetype)TerminalExpression:(NSString *)data{
    TerminalExpression *ter=[[TerminalExpression alloc]init];
    ter.data = data;
    return ter;
}
- (BOOL)interpret:(NSString *)context{
    if ([context containsString:self.data]) {
        return YES;
    }
    return NO;
}
@end

@implementation orTerminalExpression

+ (instancetype)TerminalExpression:(TerminalExpression *)ter1 or:(TerminalExpression *)ter2{
    orTerminalExpression *ter=[[orTerminalExpression alloc]init];
    ter.ter1 = ter1;
    ter.ter2 = ter2;
    return ter;
}
-(BOOL)interpret:(NSString *)context{
    return [self.ter1 interpret:context] || [self.ter2 interpret:context];
}
@end
@implementation andTerminalExpression

+ (instancetype)TerminalExpression:(TerminalExpression *)ter1 or:(TerminalExpression *)ter2{
    andTerminalExpression *ter=[[andTerminalExpression alloc]init];
    ter.ter1 = ter1;
    ter.ter2 = ter2;
    return ter;
}
-(BOOL)interpret:(NSString *)context{
    return [self.ter1 interpret:context] && [self.ter2 interpret:context];
}
@end
