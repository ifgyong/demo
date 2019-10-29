//
//  FYNodeManger.m
//  VCStatistics
//
//  Created by Charlie on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYNodeManger.h"
#import "FYNodeAdpter.h"
#import "FYNodeMap.h"
 



@interface FYNodeManger ()
@property (nonatomic,strong) NSMutableDictionary * info;
@end

@implementation FYNodeManger
+ (instancetype)shared{
	static FYNodeManger *manger;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		manger =[[FYNodeManger alloc]init];
	});
	return manger;
}
- (NSMutableDictionary *)info{
	if (_info == nil) {
		_info =[NSMutableDictionary dictionary];
	}
	return _info;
}
- (void)appendClsName:( NSString * )clsName sel:(__nonnull SEL)sel imp:(__nonnull IMP)imp types:(nonnull const char *)type mapType:(FYNodeMapType)tp toSel:(__nullable SEL)toSEL{
    FYNodeMap *  node = [[FYNodeMap alloc]initWith:sel
											   imp:imp
										   clsName:clsName
											 types:type
											  next:nil
										   mapType:tp
											 toSEL:toSEL];
	[self append:node];
}
- (void)append:(FYNodeMap* )node{
    assert(node.imp && node.selName);
	if ( node.imp && node.selName) {
		NSString * selName = NSStringFromSelector(node.selName);
		FYNodeAdpter * subNode = [self.info objectForKey:selName];
		if (subNode == nil) {
			subNode = [[FYNodeAdpter alloc]init];
            [self.info setObject:subNode forKey:selName];
		}
		[subNode append:node];
	}
}
- (FYNodeAdpter * )objectForSEL:(NSString *)selName{
    NSAssert(selName.length == 0, @"sel name不能为空");
    return [self.info objectForKey:selName];
}
+(FYNodeAdpter *)objectForSEL:(NSString *)selName{
    return [[FYNodeManger shared] objectForSEL:selName];
}
- (NSString *)description{
	NSMutableString *str =[NSMutableString stringWithString:@"\n"];
	[str appendString:@"=============================================\n\n"];
	
	[str appendString:@"              MSL Version 1.0\n"];
	[str appendString:@"     author:fgyong  mail:fgyong214@gmail.com\n\n"];

	[str appendString:@"=============================================\n"];
	[str appendString:@"↴：替换   ⇄ ：交换\n\n"];
	[str appendString:@"举个例子：\n例子1：test2 交换到test1，然后交换到test3，最终imp是0x105c6c630\n\n"];
	[str appendString:@"⇄ | + test2 -> test1 -> test3 -> imp:0x105c6c630\n\n"];
	[str appendString:@"例子2：test1 的imp替换到0x105c6c660，然后又替换到0x105c6c690，又替换到0x105c6c600，\n又交换到了test2，又交换到了test3->又交换到了test4\n\n"];
	[str appendString:@"↴ | + test1 -> imp:0x105c6c660\n\
	↴ | +   test1 -> imp:0x105c6c690 \n\
	↴ | +     test1 -> imp:0x105c6c600\n\
	⇄ | +       test1 -> test2 -> imp:0x105c6c600\n\
	⇄ | +         test1 -> test3 -> imp:0x105c6c630\n\
	⇄ | +           test1 -> test4 -> imp:0x105c6c660\n\n"];
	[str appendString:@"=============================================\n"];

	for (FYNodeAdpter *item in self.info.allValues) {
		[str appendString:item.description];
	}
	return [str copy];
}
@end
