//
//  ViewController.m
//  day03-KVO本质
//
//  Created by Charlie on 2019/7/2.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYPerson.h"
#import "Header.h"
#import <Foundation/Foundation.h>

@interface ViewController ()
@property (nonatomic,strong)FYPerson *person;
@property (nonatomic,strong)FYPerson *person2;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Do any additional setup after loading the view.
	self.person=[FYPerson new];
	self.person2 =[FYPerson new];
	self.person.age = 10;
	[self.person addObserver:self
					  forKeyPath:@"age"
						 options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
						 context:nil];
	
	
//	[self printMethods:object_getClass(_person)];
//	[self printMethods:object_getClass(_person2)];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	int age = self.person.age + 1;
	
	[self.person setAge:age];
	
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
	NSLog(@"监听到了age变化： %@",change);
}
- (void) printMethods:(Class)cls
{
	unsigned int count ;
	Method *methods = class_copyMethodList(cls, &count);
	NSMutableString *methodNames = [NSMutableString string];
	[methodNames appendFormat:@"%@ - ", cls];
	
	for (int i = 0 ; i < count; i++) {
		Method method = methods[i];
		NSString *methodName  = NSStringFromSelector(method_getName(method));
		
		[methodNames appendString: methodName];
		[methodNames appendString:@" "];
		
	}
	
	NSLog(@"%@",methodNames);
	free(methods);
}
-(void)dealloc{
	[self.person removeObserver:self forKeyPath:@"age"];
}

@end
