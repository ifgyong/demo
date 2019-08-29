//
//  OCFile.m
//  main
//
//  Created by Charlie on 2019/8/28.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "OCFile.h"

@implementation OCFile
- (void)run{
	printf("%s",__func__);
}
+ (void)run{
	printf("%s",__func__);
	Car *c = [[Car alloc]initWithP:2.0 b:@"band"];
	[c test];
	
	
}

@end
int sum(int a,int b){
	return a+b;
}
void test(){
	Car *c = [[Car alloc]initWithP:3.0 b:@"123"];
	[c test];
}
