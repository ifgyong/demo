//
//  main.m
//  day17-autoreleasepool
//
//  Created by Charlie on 2019/8/1.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYPerson.h"
extern void _objc_autoreleasePoolPrint(void);
int main(int argc, const char * argv[]) {
	@autoreleasepool {//r1 = push()
		//转化成c++文件
//xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc -f  main.m
//		FYPerson *p = [[[FYPerson alloc]init] autorelease];
//		FYPerson *p2 = [[[FYPerson alloc]init] autorelease];
//		@autoreleasepool {//r1 = push()
//
//			FYPerson *p3 = [[[FYPerson alloc]init] autorelease];
//			FYPerson *p4 = [[[FYPerson alloc]init] autorelease];
//
//			_objc_autoreleasePoolPrint();
//			printf("\n--------------\n");
//		}//pop(r1)
//		_objc_autoreleasePoolPrint();
//		printf("\n--------------\n");
		
		
		FYPerson *p=[[FYPerson alloc]init];
		FYPerson *p2 =[p retain];
		//code here
		[p release];
		[p2 release];
		
		
	}//pop(r1)
	return 0;
}

//{
//	__AtAutoreleasePool __autoreleasepool;
//}

/*
 
struct __AtAutoreleasePool {
	__AtAutoreleasePool() {//构造函数 生成结构体变量的时候调用
		atautoreleasepoolobj = objc_autoreleasePoolPush();
	}
	~__AtAutoreleasePool() {//析构函数 销毁的时候调用
		objc_autoreleasePoolPop(atautoreleasepoolobj);
	}
	void * atautoreleasepoolobj;
};
__AtAutoreleasePool pool = objc_autoreleasePoolPush();
FYPerson *p = [[FYPerson alloc]init];
objc_autoreleasePoolPop(pool)

 */
