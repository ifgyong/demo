//
//  Builder.m
//  04建造者模式
//
//  Created by Charlie on 2019/8/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Builder.h"

@implementation BuilderA

- (void)buildPartA{
	printf("build A");
}
-(instancetype)getResult
{
	return self;
}
@end
@implementation BuilderB

- (void)buildPartB{
	printf("build B");
}
-(instancetype)getResult
{
	return self;
}
@end


@interface Builder ()
{
	id<Builder> _bd;
}
@end
@implementation Builder
- (id)constuct{
	//加工几个步骤
	[_bd buildPartA];
	[_bd buildPartB];
	[_bd buildPartC];
	//组装得到产品
	return [_bd getResult];
}
- (void)setBuilder:(id<Builder>)bd{
	_bd = bd;
}
@end
