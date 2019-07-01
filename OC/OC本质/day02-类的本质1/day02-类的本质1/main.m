//
//  main.m
//  day02-类的本质1
//
//  Created by Charlie on 2019/7/1.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface Person:NSObject {
}
@end
@implementation Person
@end
struct objc_ivar_list {
	int ivar_count                                           OBJC2_UNAVAILABLE;
#ifdef __LP64__
	int space                                                OBJC2_UNAVAILABLE;
#endif
	/* variable length structure */
	struct objc_ivar ivar_list[1]                            OBJC2_UNAVAILABLE;
}                                                            OBJC2_UNAVAILABLE;
struct objc_ivar {
	char * _Nullable ivar_name                               OBJC2_UNAVAILABLE;
	char * _Nullable ivar_type                               OBJC2_UNAVAILABLE;
	int ivar_offset                                          OBJC2_UNAVAILABLE;
#ifdef __LP64__
	int space                                                OBJC2_UNAVAILABLE;
#endif
};

struct objc_method {
	SEL _Nonnull method_name                                 OBJC2_UNAVAILABLE;
	char * _Nullable method_types                            OBJC2_UNAVAILABLE;
	IMP _Nonnull method_imp                                  OBJC2_UNAVAILABLE;
}                    ;                                        OBJC2_UNAVAILABLE;

struct objc_method_list {
	struct objc_method_list * _Nullable obsolete             OBJC2_UNAVAILABLE;
	
	int method_count                                         OBJC2_UNAVAILABLE;
#ifdef __LP64__
	int space                                                OBJC2_UNAVAILABLE;
#endif
	/* variable length structure */
	struct objc_method method_list[1]                        OBJC2_UNAVAILABLE;
};
struct objc_class2 {
	Class _Nonnull isa  OBJC_ISA_AVAILABILITY;
	
#if !__OBJC2__
	Class _Nullable super_class                              OBJC2_UNAVAILABLE;
	const char * _Nonnull name                               OBJC2_UNAVAILABLE;
	long version                                             OBJC2_UNAVAILABLE;
	long info                                                OBJC2_UNAVAILABLE;
	long instance_size                                       OBJC2_UNAVAILABLE;
	struct objc_ivar_list * _Nullable ivars                  OBJC2_UNAVAILABLE;
	struct objc_method_list * _Nullable * _Nullable methodLists                    OBJC2_UNAVAILABLE;
	struct objc_cache * _Nonnull cache                       OBJC2_UNAVAILABLE;
	struct objc_protocol_list * _Nullable protocols          OBJC2_UNAVAILABLE;
#endif
	
} OBJC2_UNAVAILABLE;
int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
//		NSObject *ob1=[[NSObject alloc]init];
//		NSObject *ob2=[[NSObject alloc]init];
//
//		Class cl1 = object_getClass([ob1 class]);
//		Class cl2 = object_getClass([ob2 class]);
//
//
//		Class cl3 = ob1.class;
//		Class cl4 = ob2.class;
//
//		Class cl5 = NSObject.class;
//		Class cl6 = objc_getClass(NSStringFromClass(NSObject.class).UTF8String);
//
//		NSLog(@" %p %p %p %p %p %p",cl1,cl2,cl3,cl4,cl5,cl6);

		
		Person *p =[[Person alloc]init];
		
	}
	return 0;
}
