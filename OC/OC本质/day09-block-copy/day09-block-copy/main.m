//
//  main.m
//  day09-block-copy
//
//  Created by Charlie on 2019/7/10.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^FYBlock)(void);
typedef void (^FYBlockInt)(int);
FYBlock myBlock(){
	return ^{
		NSLog(@"哈哈");
	};
};
FYBlock myBlock2(){
	int age = 10;
	return ^{
		NSLog(@"哈哈 %d",age);
	};
};
int main(int argc, const char * argv[]) {
	@autoreleasepool {
		FYBlock block = myBlock();
		FYBlock block2 = myBlock2();
		int age = 10;
		FYBlock block3= ^{
			NSLog(@"强指针block %d",age);
		};
		
		NSLog(@"没访问变量:%@ 访问布局变量：%@ 强指针:%@",[block class],[block2 class],[block3 class]);
	}
	return 0;
}
