//
//  main.m
//  day09-block2
//
//  Created by Charlie on 2019/7/10.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		int age = 10;
		
		void(^block1)(void)=^{
			NSLog(@"block1");
		};
		void(^block2)(void)=^{
			NSLog(@"block2 %d",age);
		};
		void(^block3)(void)=[block2 copy];
		NSLog(@"block1:%@   block2:%@ block3:%@ ",[block1 class],[block2 class],[block3 class]);
		[block3 release];
	}
	return 0;
}
