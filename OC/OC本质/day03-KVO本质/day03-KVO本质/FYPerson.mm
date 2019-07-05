//
//  FYPerson.m
//  day03-KVO本质
//
//  Created by fgy on 2019/7/2.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson.h"
@interface FYPerson(){
	@public
	NSInteger _age;
	NSInteger _isAge;
	NSInteger age;
	NSInteger isAge;



}
@end
@implementation FYPerson
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
	NSLog(@"%@",change);
}
@end
