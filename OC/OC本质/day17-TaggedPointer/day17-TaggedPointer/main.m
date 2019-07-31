//
//  main.m
//  day17-TaggedPointer
//
//  Created by fgy on 2019/7/30.
//  Copyright © 2019 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * _Nonnull argv[_Nonnull]) {
    @autoreleasepool {
//        NSNumber *n1 = @2;
//        NSNumber *n2 = @3;
//        NSNumber *n3 = @(4);
//        NSNumber *n4 = @(0x4fffffffff);
//        NSLog(@"\n%p \n%p \n%p \n%p",n1,n2,n3,n4);
//        BOOL n1_tag = objc_isTaggedPointer((__bridge const void * _Nullable)(n1));
//        BOOL n2_tag = objc_isTaggedPointer((__bridge const void * _Nullable)(n2));
//        BOOL n3_tag = objc_isTaggedPointer((__bridge const void * _Nullable)(n3));
//        BOOL n4_tag = objc_isTaggedPointer((__bridge const void * _Nullable)(n4));
//
//        NSLog(@"\nn1:%d \nn2:%d \nn3:%d \nn4:%d ",n1_tag,n2_tag,n3_tag,n4_tag);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
