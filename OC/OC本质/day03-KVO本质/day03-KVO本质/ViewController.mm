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

@interface ViewController ()
@property (nonatomic,strong)FYPerson *person;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.person=[FYPerson new];
	self.person.age = 10;
	[self.person addObserver:self
					  forKeyPath:@"age"
						 options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
						 context:nil];
    Class NSKVONotifying_FYPerson = objc_getClass("NSKVONotifying_FYPerson");
    fy_objc_class* NSKVONotifying_FYPerson_class = (__bridge fy_objc_class *)NSKVONotifying_FYPerson;
    class_rw_t *metaClass = NSKVONotifying_FYPerson_class->data();
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	self.person.age += 1;
//	[self.person willChangeValueForKey:@"age"];
//	[self.person didChangeValueForKey:@"age"];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
	NSLog(@"监听到了age变化： %@",change);
}
-(void)dealloc{
	[self.person removeObserver:self forKeyPath:@"age"];
}

@end
