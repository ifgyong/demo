//
//  main.m
//  day17-copy-1
//
//  Created by Charlie on 2019/7/31.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYPerson.h"
/*
 
 拷贝目的：产生一个副本对象，跟源对象互不影响
 修改源对象，不会影响到副本对象
 修改副本对象，不会影响源对象
 iOS提供了2中拷贝方法
 1.copy 拷贝出来不可变对象
 2.mutableCopy 拷贝出来可变对象
 */
void test1(){
	NSString *str = @"strstrstrstr";
	NSMutableString *mut1 =[str mutableCopy];
	[mut1 appendFormat:@"123"];
	NSString *str2 = [str copy];
	NSLog(@"%p %p %p",str,mut1,str2);
}
void test2(){
	NSArray *array = @[@"123",@"123",@"123",@"123",@"123",@"123",@"123"];
	NSMutableArray *mut =[array mutableCopy];
	NSString *array2 = [array copy];
	NSLog(@"\n%p \n%p\n%p",array,mut,array2);
}
void test3(){
	NSArray *array = [@[@"123",@"123",@"123",@"123",@"123",@"123",@"123"] mutableCopy];
	NSMutableArray *mut =[array mutableCopy];
	NSString *array2 = [array copy];
	NSLog(@"\n%p \n%p\n%p",array,mut,array2);
}
void test4(){
	NSDictionary *item = @{@"key":@"value"};
	NSMutableDictionary *mut =[item mutableCopy];
	NSDictionary *item2 = [item copy];
	NSLog(@"\n%p \n%p\n%p",item,mut,item2);
}
void test5(){
	NSDictionary *item = [@{@"key":@"value"}mutableCopy];
	NSMutableDictionary *mut =[item mutableCopy];
	NSDictionary *item2 = [item copy];
	NSLog(@"\n%p \n%p\n%p",item,mut,item2);
}
int main(int argc, const char * argv[]) {
	@autoreleasepool {
//		test5();
		FYPerson *p =[[FYPerson alloc]init];
		p.age = 10;
		p.level = 11;
		p.name = @"xiaowang";
		FYPerson *p2 =[p copy];
		NSLog(@"%d %d %@",p2.age,p2.level,p2.name);
	}
	return 0;
}
