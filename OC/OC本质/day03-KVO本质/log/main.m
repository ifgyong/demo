//
//  main.m
//  log
//
//  Created by Charlie on 2019/7/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Student : NSObject
@end
@implementation Student
@end

@interface FYPerson : NSObject
@property (nonatomic,assign) int age;
@end
@implementation FYPerson
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
	 [[Student alloc]init];
	NSLog(@"%@",change);
}
@end


int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		instrumentObjcMessageSends(YES);
	    NSLog(@"Hello, World!");
		
		FYPerson *person=[FYPerson new];
		
		[person addObserver:person
				 forKeyPath:@"age"
					options:NSKeyValueObservingOptionNew
					context:nil];
		Student *std =[[Student alloc]init];
		person.age = 12;
		std =[[Student alloc]init];
		instrumentObjcMessageSends(NO);
	}
	return 0;
}
