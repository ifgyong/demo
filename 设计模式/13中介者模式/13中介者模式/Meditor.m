//
//  Meditor.m
//  13中介者模式
//
//  Created by Charlie on 2019/8/19.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Meditor.h"
@interface Meditor(){
	NSMutableDictionary *_dic;
}
@end

@implementation Meditor
- (void)registerObj:(NSString *)key id:(id<ColleagueProtocol>)obj{
	if (_dic ==nil) {
		_dic=[NSMutableDictionary dictionary];
	}
	[_dic setObject:key forKey:obj];
}
- (void)sendMsg:(NSString *)key msg:(NSString *)msg{
	id <ColleagueProtocol> obj = _dic[key];
	[obj sendmsg:msg];
}
@end

@implementation ColleagueA

- (void)sendmsg:(NSString *)msg{
	NSLog(@"ColleagueA send %@",msg);
}

@end
@implementation ColleagueB

- (void)sendmsg:(NSString *)msg{
	NSLog(@"ColleagueB send %@",msg);
}

@end
