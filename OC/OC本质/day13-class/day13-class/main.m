//
//  main.m
//  day13-class
//
//  Created by fgy on 2019/7/21.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYPerson.h"


//- (BOOL)isMemberOfClass:(Class)cls {
//    return [self class] == cls;
//}
//+ (BOOL)isMemberOfClass:(Class)cls {
//    return object_getClass((id)self) == cls;
//}
//
//+ (BOOL)isKindOfClass:(Class)cls {
//    for (Class tcls = object_getClass((id)self); tcls; tcls = tcls->superclass) {
//        printf("%s %s\n",class_getName(tcls),class_getName(cls));
//        if (tcls == cls)
//        {return YES;}else{
//            printf("%s",class_getName(tcls));
//        }
//    }
//    return NO;
//}
//
//- (BOOL)isKindOfClass:(Class)cls {
//    for (Class tcls = [self class]; tcls; tcls = tcls->superclass) {
//        
//        printf(" %s %s\n",class_getName(tcls),class_getName(cls));
//        if (tcls == cls) return YES;
//    }
//    return NO;
//}
//
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Class cls = NSObject.class;
        Class pcls = FYPerson.class;
        //isKindOfClass cls->isa 和cls/cls->superclass相等吗?
        //元类对象和类对象不相等，但是最后一个元类的isa->superclass是指向NSObject的class 所以res1 = YES;
        //cls->isa:元类对象 cls->isa->superclass: NSObject类对象
        //cls:类对象
        BOOL res1 =[cls isKindOfClass:cls];
        //cls->isa 和cls相等吗？ 不相等 cls->isa是元类对象,cls是类对象，不可能相等。
        BOOL res2 =[cls isMemberOfClass:cls];
        //pcls->isa:person的元类对象 cls->isa->superclass: NSObject元类类对象 ->superclass:NSObject类对象 ->superclass:nil
        //pcls:person类对象
        BOOL res3 =[pcls isKindOfClass:pcls];
        //pcls->isa:person的元类对象
        //pcls:person类对象
        BOOL res4 =[pcls isMemberOfClass:pcls];
        NSLog(@"%d %d %d %d",res1,res2,res3,res4);

        
        
        FYPerson *p=[FYPerson new];
        NSObject *obj=[NSObject new];
        BOOL res11 =[p isKindOfClass:pcls];
        BOOL res12 =[p isMemberOfClass:pcls];
        BOOL res13 =[obj isKindOfClass:cls];
        BOOL res14 =[obj isMemberOfClass:cls];
        NSLog(@"instance:%d %d %d %d",res11,res12,res13,res14);
        
        
        
        NSLog(@"");
    }
    return 0;
}
