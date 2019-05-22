//
//  Logger.h
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    LevelInfo = 1,
    LevelDEBUG = 2,
    LevelError = 3,
} ErrorLevel;

@interface AbstractLogger : NSObject
@property (nonatomic,assign) ErrorLevel level;
@property (nonatomic,strong) AbstractLogger *nextLogger;

- (void)logMessage:(int)level msg:(NSString *)message;

- (void)write:(NSString *)msg;

@end
@interface ConsoleLogger : AbstractLogger
+ (instancetype)consoleLogger:(ErrorLevel)level;
@end
@interface ErrorLogger : AbstractLogger
+ (instancetype)ErrorLogger:(ErrorLevel)level;
@end
@interface FileLogger : AbstractLogger
+ (instancetype)FileLogger:(ErrorLevel)level;
@end

@interface Logger : NSObject

@end

NS_ASSUME_NONNULL_END
