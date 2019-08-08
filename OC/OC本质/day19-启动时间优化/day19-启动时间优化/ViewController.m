//
//  ViewController.m
//  day19-启动时间优化
//
//  Created by fgy on 2019/8/7.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
static void blockCleanUp(__strong void(^*block)(void)) {
	(*block)();
}

#define onExit \
__strong void(^block)(void) __attribute__((cleanup(blockCleanUp), unused)) = ^

__attribute__ ((constructor(103)))
void beforeMain(void){
	printf("%s ViewController \n",__func__);
};
//数字越小 相同一个class调用优先级越高 1-100为系统保留范围。
__attribute__ ((constructor(101)))
void beforeMain2(void){
	printf("%s ViewController \n",__func__);
};

__attribute__ ((destructor))
void afterMain(){
	printf("%s ViewController \n",__func__);
}
+ (void)load{
	printf("%s  %s\n",__func__,NSStringFromClass(self).UTF8String);
}
+ (void)initialize{
	printf("%s  %s\n",__func__,NSStringFromClass(self).UTF8String);
}
- (void)viewDidLoad {
    [super viewDidLoad];
	//在变量超出作用区域时进行回调
	onExit{
		printf(" onExit");
	};
	printf("%s \n",__func__);
}


@end
