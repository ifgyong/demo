//
//  FYPerson.m
//  day11-runtime1
//
//  Created by Charlie on 2019/7/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson.h"
#import <objc/runtime.h>

@implementation FYPerson
+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@"%s",__func__);
    if (sel == @selector(test)) {
//        Method me = class_getInstanceMethod(self, @selector(test3));
//        class_addMethod(self.class, sel, method_getImplementation(me), method_getTypeEncoding(me));
        class_addMethod(self.class, sel, (IMP)test3, "v16@0:8");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
void test3(id self,SEL sel){
    NSLog(@"test3:%s",NSStringFromSelector(sel).UTF8String);
}
//-(void)test3{
//    NSLog(@"%s",__func__);
//}
@end
