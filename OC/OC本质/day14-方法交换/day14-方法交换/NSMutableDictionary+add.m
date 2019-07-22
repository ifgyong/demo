//
//  NSMutableDictionary+add.m
//  day14-方法交换
//
//  Created by fgy on 2019/7/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "NSMutableDictionary+add.h"
#import "objc/runtime.h"
@implementation NSMutableDictionary (add)
+ (void)load{
    Class cls= NSClassFromString(@"__NSDictionaryM");
    Method m1= class_getInstanceMethod(cls, @selector(setObject:forKey:));
//    __NSDictionaryM
    SEL sel = @selector(fy_setObject:forKey:);
    Method m2= class_getInstanceMethod(cls, sel);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(m1, m2);
    });
}
- (void)fy_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (anObject) {
        [self fy_setObject:anObject forKey:aKey];
    }else{
        NSString * key = (NSString *)aKey;
        printf("key:%s anobj is nil",key.UTF8String);
    }
}
@end
