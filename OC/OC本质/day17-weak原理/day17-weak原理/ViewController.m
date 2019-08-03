//
//  ViewController.m
//  day17-weak原理
//
//  Created by Charlie on 2019/8/1.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    //默认是 __strong 引用计数+1
	__strong	FYPerson *p1 ;//=[[FYPerson alloc]init];
	__weak FYPerson *p2; //__weak 修饰的对象 引用计数不变，但是在dealloc函数中检查或销毁,超过p2有效范围则自动重置为nil
    //__unsafe_unretained 超出有效范围 不会重置为nil
	__unsafe_unretained FYPerson * p3;
	NSLog(@"start");
	{
		FYPerson *p =[[FYPerson alloc]init];
		p2 = p;
	}
	NSLog(@"end -- %@",p3);
}
-(void)dealloc{
	NSLog(@"%s",__func__);
}


@end
