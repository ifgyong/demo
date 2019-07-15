//
//  FYPerson.m
//  day10-runtime
//
//  Created by Charlie on 2019/7/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYPerson.h"

//#define FYHandsomeMask 0b00000001
//#define FYTallMask 0b00000010
//#define FYRichMask 0b00000001


#define FYHandsomeMask (1<<0)
#define FYTallMask (1<<1)
#define FYRichMask (1<<2)

@interface FYPerson()
{
//	char _richTellHandsome;//0000 0000 rich tall handsome
	//位域
	struct{
		char tall : 1;//高度
		char rich : 1;//富有
		char handsome : 1; //帅
	} _richTellHandsome; // 0b0000 0000
	//使用2位 yes就是0b01 转化成1字节8位就是:0o0101 0101 结果是1
	//使用1位 yes就是0b1 转化成1字节8位就是:0o1111 1111 所以结果是-1
}
@end


@implementation FYPerson

- (void)setRich:(BOOL)tall{
	_richTellHandsome.rich = tall;
}
- (void)setTall:(BOOL)tall{
	_richTellHandsome.tall = tall;
}
- (void)setHandsome:(BOOL)tall{
	_richTellHandsome.handsome = tall;
}
- (BOOL)isRich{
	return !!_richTellHandsome.rich;
}
- (BOOL)isTall{
	return !!_richTellHandsome.tall;
}
- (BOOL)isHandsome{
	return !!_richTellHandsome.handsome;
}
@end
