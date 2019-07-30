//
//  main.m
//  day17-内存布局
//
//  Created by fgy on 2019/7/30.
//  Copyright © 2019 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
int a = 10;
int b ;
int main(int argc, char * argv[]) {
    @autoreleasepool {
        static int c = 20;
        static int d;
        int e = 10;
        int f;
        NSString * str = @"123";
        NSObject *obj =[[NSObject alloc]init];
        NSLog(@"\na:%p \nb:%p \nc:%p \nd:%p \ne:%p \nf:%p \nobj:%p\n str:%p",&a,&b,&c,&d,&e,&f,obj,str);
        /*
         a:0x1091d4d98
         b:0x1091d4e64
         c:0x1091d4d9c
         d:0x1091d4e60
         obj:0x600002a60250
         str:0x1091d4068
         */
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
