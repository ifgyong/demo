//
//  main.m
//  day17-TaggedPointer
//
//  Created by fgy on 2019/7/30.
//  Copyright © 2019 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#if OBJC_MSB_TAGGED_POINTERS
#   define _OBJC_TAG_MASK (1UL<<63)
#else
#   define _OBJC_TAG_MASK 1UL
#endif
bool objc_isTaggedPointer(const void * _Nullable ptr)
{
    return ((uintptr_t)ptr & _OBJC_TAG_MASK) == _OBJC_TAG_MASK;
}
int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSNumber *n1 = @2;
        NSNumber *n2 = @3;
        NSNumber *n3 = @(4);
        NSNumber *n4 = @(0x4fffffffff);
        NSLog(@"\n%p \n%p \n%p \n%p",n1,n2,n3,n4);
        BOOL n1_tag = objc_isTaggedPointer((__bridge const void * _Nullable)(n1));
        BOOL n2_tag = objc_isTaggedPointer((__bridge const void * _Nullable)(n2));
        BOOL n3_tag = objc_isTaggedPointer((__bridge const void * _Nullable)(n3));
        BOOL n4_tag = objc_isTaggedPointer((__bridge const void * _Nullable)(n4));

        NSLog(@"\nn1:%d \nn2:%d \nn3:%d \nn4:%d ",n1_tag,n2_tag,n3_tag,n4_tag);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
