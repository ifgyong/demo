//
//  Logger.m
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Logger.h"

@implementation Logger

@end
@implementation AbstractLogger
- (void)logMessage:(int)level msg:(NSString *)message{
    if (self.level <= level) {
        [self write:message];
    }
    if (_nextLogger) {
        [_nextLogger logMessage:level msg:message];
    }
}
- (void)write:(NSString *)msg{}
@end

@implementation ConsoleLogger

+ (instancetype)consoleLogger:(ErrorLevel)level{
    ConsoleLogger *log=[[ConsoleLogger alloc]init];
    log.level = level;
    return log;
}
- (void)write:(NSString *)msg{
    NSLog(@"ConsoleLogger write:%@",msg);
}
@end
@implementation ErrorLogger

+ (instancetype)ErrorLogger:(ErrorLevel)level{
    ErrorLogger *log=[[ErrorLogger alloc]init];
    log.level = level;
    return log;
}
- (void)write:(NSString *)msg{
    NSLog(@"ErrorLogger write:%@",msg);
}
@end

@implementation FileLogger

+ (instancetype)FileLogger:(ErrorLevel)level{
    FileLogger *log=[[FileLogger alloc]init];
    log.level = level;
    return log;
}
- (void)write:(NSString *)msg{
    NSLog(@"FileLogger write:%@",msg);
}
@end
