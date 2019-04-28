//
//  main.m
//  runtime_demo
//
//  Created by fgy on 2019/4/18.
//  Copyright © 2019 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/message.h>
#import <objc/runtime.h>


int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
