//
//  main.m
//  day14-runloop
//
//  Created by Charlie on 2019/7/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		CFRunLoopRef runloop = CFRunLoopGetMain();
		CFRunLoopMode mode = CFRunLoopCopyCurrentMode(runloop);
	}
	return 0;
}
