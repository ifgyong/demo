//
//  Person+add2.m
//  testIvarPublic
//
//  Created by Charlie on 2019/5/8.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Person+add2.h"

@implementation Person (add2)
+ (void)load{
    printf("\nPerson_add2 %s",__FUNCTION__);
}
+ (void)initialize{
    printf("\nPerson_add2 %s",__FUNCTION__);
    
}


- (void)say{
    printf("\nPerson %s",__FUNCTION__);
}
@end
