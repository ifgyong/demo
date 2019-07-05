//
//  FYPerson.m
//  day04-KVC
//
//  Created by Charlie on 2019/7/5.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson.h"

@interface FYPerson()
@end
@implementation FYPerson
//- (void)setAge:(NSInteger)age{
//	NSLog(@"%s %ld",__func__,(long)age);
//}
//- (void)_setAge:(NSInteger)age{
//	NSLog(@"%s %ld",__func__,(long)age);
//}
+(BOOL)accessInstanceVariablesDirectly{
	return YES;
}
@end
