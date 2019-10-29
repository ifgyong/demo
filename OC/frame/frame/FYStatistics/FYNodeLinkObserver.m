//
//  FYNodeLinkObserver.m
//  VCStatistics
//
//  Created by Charlie on 2019/9/4.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYNodeLinkObserver.h"
#import "fishhook.h"
#import <objc/runtime.h>
#import "FYNodeManger.h"

static IMP  (*ori_class_replaceMethod)(Class _Nullable __unsafe_unretained cls,SEL _Nonnull name,IMP _Nonnull imp,const char * _Nullable types);
static void (*ori_method_exchangeImplementations)(Method _Nonnull m1, Method _Nonnull m2);


@implementation FYNodeLinkObserver
+ (void)load{
#if DEBUG
	//class_replaceMethod
	fy_rebind("class_replaceMethod",fy_class_replaceMethod,(void*)&ori_class_replaceMethod);
	//ori_method_exchangeImplementations
	fy_rebind("method_exchangeImplementations", fy_method_exchangeImplementations, (void*)&ori_method_exchangeImplementations);
#endif
}
void fy_rebind(const char * selName,void *replacement,void **replaced){
	struct rebinding ex;
	ex.name = selName;
	ex.replacement = replacement;
	ex.replaced = replaced;
	struct rebinding res[] = {ex};
	int ret = rebind_symbols(res, 1);
	if (ret == 0) {
#if DEBUG
//		NSLog(@"%s did replaced",selName);
#endif
	}
}


IMP (fy_class_replaceMethod)(Class _Nullable __unsafe_unretained cls,SEL _Nonnull name,IMP _Nonnull imp,const char * _Nullable types){
	[[FYNodeManger shared] appendClsName:NSStringFromClass(cls) sel:name imp:imp types:types mapType:FYNodeMapTypeReplaced toSel:nil];
	
	return ori_class_replaceMethod(cls, name, imp, types);
}
void (fy_method_exchangeImplementations)(Method _Nonnull m1, Method _Nonnull m2){
	[[FYNodeManger shared] appendClsName:@""
									 sel:method_getName(m1)
									 imp:method_getImplementation(m1)
								   types:method_getTypeEncoding(m1)
								 mapType:FYNodeMapTypeExchange
								   toSel:method_getName(m2)];
	[[FYNodeManger shared] appendClsName:@""
									 sel:method_getName(m2)
									 imp:method_getImplementation(m2)
								   types:method_getTypeEncoding(m2)
								 mapType:FYNodeMapTypeExchange
								   toSel:method_getName(m1)];
	ori_method_exchangeImplementations(m1,m2);
}

@end
