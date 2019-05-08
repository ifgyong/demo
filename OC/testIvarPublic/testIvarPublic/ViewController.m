//
//  ViewController.m
//  testIvarPublic
//
//  Created by Charlie on 2019/5/7.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "Person3.h"
#import "Person.h"
/*
 测试package 可用范围 打包成framwork 仍然可用
 public 同可用
 
 为保险 常用 .h中对外公开的属性 .m一般是隐私的属性
 
 @public 外部可访问
 
 @private 紧紧自己类可用
 
 @protected 自己类
 
 @package
 */
@interface ViewController ()



@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    Person3 *p=[Person3 new];
    [p say];
    
}
- (void) getPropertyList{
    unsigned int  count = 0;
    objc_property_t *propertyList = class_copyPropertyList([Person class], &count);
    for (int i  =0; i < count; i ++) {
        objc_property_t p = propertyList[i];
        NSLog(@" %s",property_getName(p));
    }
    free(propertyList);
}
- (void) getAllIvarList {
    unsigned int methodCount = 0;
    Ivar * ivars = class_copyIvarList([Person class], &methodCount);
    for (unsigned int i = 0; i < methodCount; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        const char*type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量的类型为%s，名字为 %s ",type, name);
    }
    free(ivars);
}
- (void) getAllMethodList{
    unsigned int count = 0;
    Method *methods = class_copyMethodList([Person class], &count);
    for (int i = 0; i < count; i ++) {
        Method m = methods[i];
        SEL sel = method_getName(m);
        NSLog(@"method:%@",NSStringFromSelector(sel));
    }
}
-(void)testPersonKeyValue{
    Person *p=[[Person alloc]init];
    [p setValue:@"protectedName_set" forKey:@"protectedName"];
    NSString *protectedName = [p valueForKeyPath:@"protectedName"];
    
    [p setValue:@"packageName_set" forKey:@"packageName"];
    NSString *packageName = [p valueForKeyPath:@"packageName"];
    
    [p setValue:@"publicName_set" forKey:@"publicName"];
    NSString *publicName = [p valueForKeyPath:@"publicName"];
    
    [p setValue:@"privateName_set" forKey:@"privateName"];
    NSString *privateName = [p valueForKeyPath:@"privateName"];
    
    NSLog(@"1:%@ 2:%@ 3:%@ 4:%@",publicName,packageName,protectedName,privateName);
    
    
    Person2 *p2=[Person2 new];
    [p2 setValue:@"protectedName_set_1" forKey:@"protectedName"];
    protectedName = [p2 valueForKeyPath:@"protectedName"];
    
    [p2 setValue:@"packageName_set_1" forKey:@"packageName"];
    packageName = [p2 valueForKeyPath:@"packageName"];
    
    [p2 setValue:@"publicName_set_1" forKey:@"publicName"];
    publicName = [p2 valueForKeyPath:@"publicName"];
    
    [p2 setValue:@"privateName_set_1" forKey:@"privateName"];
    privateName = [p2 valueForKeyPath:@"privateName"];
    NSLog(@"1:%@ 2:%@ 3:%@ 4:%@",publicName,packageName,protectedName,privateName);
}

@end
