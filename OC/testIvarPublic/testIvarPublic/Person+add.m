//
//  Person+add.m
//  testIvarPublic
//
//  Created by Charlie on 2019/5/8.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "Person+add.h"

@implementation Person (add)
+ (void)load{
    printf("\nPerson_add %s",__FUNCTION__);
}
+ (void)initialize{
    printf("\nPerson_add %s",__FUNCTION__);

}

- (void)say{
    printf("\nPerson %s",__FUNCTION__);
}
@end
