//
//  FYPerson+test.m
//  day05-Category
//
//  Created by Charlie on 2019/7/5.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson+test.h"

@implementation FYPerson (test)
- (void)test{
	NSLog(@"test is run");
}
-(void)run{
	NSLog(@"%s run",__func__);
}
@end
