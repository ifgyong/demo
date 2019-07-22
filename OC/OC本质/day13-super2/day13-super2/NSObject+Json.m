//
//  NSObject+Json.m
//  day13-super2
//
//  Created by Charlie on 2019/7/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "NSObject+Json.h"
#import "objc/runtime.h"


@implementation NSObject (Json)
+ (instancetype)fy_objectWithJson:(NSDictionary *)json{
	id obj = [[self alloc]init];
	unsigned int count = 0;
	Ivar *vars= class_copyIvarList(self, &count);
	for (int i = 0; i < count; i ++) {
		Ivar item = vars[i];
		const char *name = ivar_getName(item);
		NSString * nameOC= [NSString stringWithUTF8String:name];
		if (nameOC.length>1) {
			nameOC = [nameOC substringFromIndex:1];
			NSString * value = json[nameOC];
			if ([value isKindOfClass:NSString.class] && value.length) {
				[obj setValue:value forKey:nameOC];
			}else if ([value isKindOfClass:NSArray.class]){
				[obj setValue:value forKey:nameOC];
			}else if ([value isKindOfClass:NSDictionary.class]){
				[obj setValue:value forKey:nameOC];
			}else if ([value isKindOfClass:[NSNull class]] || [value isEqual:nil])
			{
				printf("%s value is nil or null \n",name);
			}else if ([value integerValue] > 0){
				[obj setValue:value forKey:nameOC];
			}else{
				printf("未知错误 \n");
			}
		}
	}
	free(vars);
	return obj;
}
@end
