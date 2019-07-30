//
//  main.m
//  day17-定时器
//
//  Created by Charlie on 2019/7/30.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FYProxy.h"
#import "ViewController.h"
#import "FYTimerTarget.h"

int main(int argc, char * argv[]) {
	@autoreleasepool {
        ViewController *vc1 =[[ViewController alloc]init];
        FYProxy *pro1 =[FYProxy proxyWithTarget:vc1];
        
        FYTimerTarget *tar =[FYTimerTarget proxyWithTarget:vc1];
        BOOL ret1 = [pro1 isKindOfClass:ViewController.class];
        BOOL ret2 = [tar isKindOfClass:ViewController.class];
        // 1 0
        NSLog(@"%d %d",ret1,ret2);
        
        
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
