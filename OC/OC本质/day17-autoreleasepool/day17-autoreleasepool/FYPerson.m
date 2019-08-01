//
//  FYPerson.m
//  day17-autoreleasepool
//
//  Created by Charlie on 2019/8/1.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson.h"

@implementation FYPerson
-(void)dealloc{
	NSLog(@"%s",__func__);
	[super dealloc];
}
@end
