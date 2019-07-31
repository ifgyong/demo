//
//  FYPerson.m
//  day17-copy-1
//
//  Created by Charlie on 2019/7/31.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson.h"
#import <objc/runtime.h>

@interface FYPerson()
@end

@implementation FYPerson
//-(instancetype)copyWithZone:(NSZone *)zone{
//    FYPerson *p=[[FYPerson alloc]init];
//    //成员变量个数
//    unsigned int count;
//    //赋值成员变量数组
//    Ivar *ivars = class_copyIvarList(self.class, &count);
//    //遍历数组
//    for (int i = 0; i < count; i ++) {
//        Ivar var = ivars[i];
//        //获取成员变量名字
//        const char * name = ivar_getName(var);
//        if (name != nil) {
//            NSString *v = [NSString stringWithUTF8String:name];
//            id value = [self valueForKey:v];
//            //给新的对象赋值
//            if (value != NULL) {
//                [p setValue:value forKey:v];
//            }
//        }
//    }
//    free(ivars);
//    return p;
//}

@end
