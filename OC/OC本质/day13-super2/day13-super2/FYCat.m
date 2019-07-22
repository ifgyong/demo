//
//  FYCat.m
//  day13-super2
//
//  Created by Charlie on 2019/7/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYCat.h"

@implementation FYCat
void test(int a ){
	
	
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
	return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation{
	[super forwardInvocation:anInvocation];
	//汇编objc_msgSendSuper2(self,superclass,@selector(forwardInvocation),anInvocation)
	//转cpp文件
//	 (void *)objc_msgSendSuper)({self,
//								class_getSuperclass(objc_getClass("FYCat"))},
//								sel_registerName("forwardInvocation:"),
//								(NSInvocation *)anInvocation);
	//Product->Perform action->Assemble 得到当前平台的汇编文件
	//搜索 【:25】 25:是代码的行号
	
	
	int a= 10;
	int b = 11;
	int c = a + b;
	test(c);
}
@end
