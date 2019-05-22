//
//  Pattern.h
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PatternProtocol <NSObject>

- (BOOL)interpret:(NSString *)context;

@end
@interface TerminalExpression : NSObject<PatternProtocol>

@property (nonatomic,copy) NSString *data;

+ (instancetype)TerminalExpression:(NSString *)data;
- (BOOL)interpret:(NSString *)context;
@end


@interface orTerminalExpression : NSObject<PatternProtocol>

@property (nonatomic,strong) TerminalExpression *ter1;
@property (nonatomic,strong) TerminalExpression *ter2;

+ (instancetype)TerminalExpression:(TerminalExpression *)ter1 or:(TerminalExpression *)ter2;
- (BOOL)interpret:(NSString *)context;
@end

@interface andTerminalExpression : NSObject<PatternProtocol>

@property (nonatomic,strong) TerminalExpression *ter1;
@property (nonatomic,strong) TerminalExpression *ter2;

+ (instancetype)TerminalExpression:(TerminalExpression *)ter1 or:(TerminalExpression *)ter2;
- (BOOL)interpret:(NSString *)context;
@end
NS_ASSUME_NONNULL_END
