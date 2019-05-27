//
//  main.m
//  objc-test
//
//  Created by GongCF on 2018/12/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <dlfcn.h>
#import <mach-o/ldsyms.h>
#import "Person.h"

void checkClassKindAndMember(void);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Class newClass = objc_allocateClassPair(objc_getClass("NSObject"), "newClass", 0);
        objc_registerClassPair(newClass);
        id newObject = [[newClass alloc]init];
        NSLog(@"%@",newObject);

        checkClassKindAndMember();
    }
    return 0;
}
void checkClassKindAndMember(void){
    NSObject *item =[NSObject new];
    item = [Person new];
    NSLog(@"item isKindOfClass NSObject:%d",[item isKindOfClass:NSObject.class]);
//    NSLog(@"item isMemberOfClass NSObject:%d",[item isMemberOfClass:NSObject.class]);
    
    NSLog(@"Person class isKindOfClass NSObject:%d",[item.class isKindOfClass:NSObject.class]);
//    NSLog(@"Person class isMemberOfClass NSObject:%d",[item.class isMemberOfClass:NSObject.class]);
}
