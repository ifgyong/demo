//
//  FYNewsService.m
//  day18-分层设计
//
//  Created by Charlie on 2019/8/6.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYNewsService.h"
#import "FYDBPool.h"
#import "FYHttpPool.h"
@interface FYNewsService ()
@property (nonatomic,strong) FYDBPool *db;
@property (nonatomic,strong) FYHttpPool *http;

@end
@implementation FYNewsService
-(instancetype)init{
	if (self = [super init]) {
		self.db=[FYDBPool new];
		self.http=[FYHttpPool new];
	}
	return self;
}
- (void)loadNewsWithInfo:(NSDictionary *)info
				 success:(succcessCallback )succblock
					fail:(dispatch_block_t)failBlock{
	[self.db loadNewsWithInfo:info success:^(NSArray * _Nonnull ret) {
		if ([ret count]) {
			succblock(ret);
		}else{
			[self.http loadNewsWithInfo:info success:^(NSArray * _Nonnull ret) {
				succblock(ret);
			} fail:failBlock];
		}
	} fail:^{
		[self.http loadNewsWithInfo:info success:^(NSArray * _Nonnull ret) {
			succblock(ret);
		} fail:failBlock];
	}];
}
@end
