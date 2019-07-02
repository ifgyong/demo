//
//  main.m
//  day02-类的本质1
//
//  Created by Charlie on 2019/7/1.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#import "Header.h"







@interface Person : NSObject <NSCopying>
{
@public
	int _age;
}
@property (nonatomic, assign) int height;
- (void)personMethod;
+ (void)personClassMethod;
@end

@implementation Person
- (void)personMethod {}
+ (void)personClassMethod {}
@end

/* Student */
@interface Student : Person <NSCoding>
{
@public
	int _no;
}

@property (nonatomic, assign) int score;
- (void)studentMethod;
+ (void)studentClassMethod;
@end

@implementation Student
- (void)studentMethod {}
+ (void)studentClassMethod {}
@end

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSObject *object = [[NSObject alloc] init];
		Person *person = [[Person alloc] init];
		Student *student = [[Student alloc] init];
		
		fy_objc_class *objectClass = (__bridge fy_objc_class *)[object class];
		fy_objc_class *personClass = (__bridge fy_objc_class *)[person class];
		fy_objc_class *studentClass = (__bridge fy_objc_class *)[student class];
		
		fy_objc_class *objectMetaClass = objectClass->metaClass();
		fy_objc_class *personMetaClass = personClass->metaClass();
		fy_objc_class *studentMetaClass = studentClass->metaClass();
		
		class_rw_t *objectClassData = objectClass->data();
		class_rw_t *personClassData = personClass->data();
		class_rw_t *studentClassData = studentClass->data();
		
		class_rw_t *objectMetaClassData = objectMetaClass->data();
		class_rw_t *personMetaClassData = personMetaClass->data();
		class_rw_t *studentMetaClassData = studentMetaClass->data();
		//Student -> Person -> NSObject
		// 0x00007ffffffffff8
		NSLog(@"%p %p %p %p %p %p",  objectClassData, personClassData, studentClassData,
			  objectMetaClassData, personMetaClassData, studentMetaClassData);
		
		return 0;
	}
}
