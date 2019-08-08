//
//  FYStudent.m
//  day19-启动时间优化
//
//  Created by Charlie on 2019/8/8.
//  Copyright © 2019 test. All rights reserved.
//

#import "FYStudent.h"

@implementation FYStudent
__attribute__ ((constructor(102)))
void beforeMainStudent(void){
	printf("%s FYStudent \n",__func__);
};
+ (void)load{
	printf("%s  %s\n",__func__,NSStringFromClass(self).UTF8String);
}
+ (void)initialize{
	printf("%s  %s\n",__func__,NSStringFromClass(self).UTF8String);
}
@end
