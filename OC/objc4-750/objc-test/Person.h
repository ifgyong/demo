//
//  Person.h
//  objc-test
//
//  Created by Charlie on 2019/5/27.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <dlfcn.h>
#import <mach-o/ldsyms.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
+ (void)test;
@end

NS_ASSUME_NONNULL_END
