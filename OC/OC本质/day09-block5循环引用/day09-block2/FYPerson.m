//
//  FYPerson.m
//  day09-block2
//
//  Created by Charlie on 2019/7/11.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson.h"

@implementation FYPerson
- (void)dealloc{
	NSLog(@"%s",__func__);
}
-(void)test{
	 __weak typeof(self) __weakself = self;
	[self setBlcok:^{
		__strong typeof(__weakself) __strongSelf = __weakself;
		NSLog(@"perosn :%p",__weakself);
	}];
	self.blcok();
}
@end
