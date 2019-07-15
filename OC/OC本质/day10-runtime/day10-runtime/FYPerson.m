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
	char _richTellHandsome;//0000 0000 rich tall handsome
}
@end


@implementation FYPerson

- (void)setRich:(BOOL)tall{
	if (tall) {
		_richTellHandsome = _richTellHandsome|FYRichMask;
	}else{
		_richTellHandsome = _richTellHandsome&~FYRichMask;
	}
	
}
- (void)setTall:(BOOL)tall{
	if (tall) {
		_richTellHandsome = _richTellHandsome|FYTallMask;
	}else{
		_richTellHandsome = _richTellHandsome&~FYTallMask;
	}
	
}
- (void)setHandsome:(BOOL)tall{
	if (tall) {
		_richTellHandsome = _richTellHandsome|FYHandsomeMask;
	}else{
		_richTellHandsome = _richTellHandsome&~FYHandsomeMask;

	}
}
- (BOOL)isRich{
	return !!(_richTellHandsome&FYRichMask);
}
- (BOOL)isTall{
	return !!(_richTellHandsome&FYTallMask);
}
- (BOOL)isHandsome{
	return !!(_richTellHandsome&FYHandsomeMask);
}
@end
