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
//	struct{
//		char tall : 1;//高度
//		char rich : 1;//富有
//		char handsome : 1; //帅
//	} _richTellHandsome; // 0b0000 0000
//	//使用2位 yes就是0b01 转化成1字节8位就是:0o0101 0101 结果是1
//	//使用1位 yes就是0b1 转化成1字节8位就是:0o1111 1111 所以结果是-1
	//共用体 大家公用一块内存
	
	union {
		char bits; //一个字节8位 ricH /tall/handsome都是占用的bits的内存空间
		struct{
			char tall : 1;//高度
			char rich : 1;//富有
			char handsome : 1; //帅
		}; // 0b0000 0000
	}_richTellHandsome;
}
@end


@implementation FYPerson

- (void)setRich:(BOOL)tall{
	if (tall) {
		_richTellHandsome.bits |= FYRichMask;
	}else{
		_richTellHandsome.bits &= ~FYRichMask;
	}
}
- (void)setTall:(BOOL)tall{
	if (tall) {
		_richTellHandsome.bits |= FYTallMask;
	}else{
		_richTellHandsome.bits &= ~FYTallMask;
	}
}
- (void)setHandsome:(BOOL)tall{
	if (tall) {
		_richTellHandsome.bits |= FYHandsomeMask;
	}else{
		_richTellHandsome.bits &= ~FYHandsomeMask;
	}
}
- (BOOL)isRich{
	return !!(_richTellHandsome.bits & FYRichMask);
}
- (BOOL)isTall{
	return !!(_richTellHandsome.bits & FYTallMask);
}
- (BOOL)isHandsome{
	return (_richTellHandsome.bits & FYHandsomeMask);
}
@end
