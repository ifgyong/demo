//
//  ViewController.m
//  day17-TaggedPointer
//
//  Created by fgy on 2019/7/30.
//  Copyright © 2019 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,copy) NSString * name;

@end

@implementation ViewController
#if (TARGET_OS_OSX || TARGET_OS_IOSMAC) && __x86_64__ //mac开发
// 64-bit Mac - tag bit is LSB
#   define OBJC_MSB_TAGGED_POINTERS 0
#else
// Everything else - tag bit is MSB
#   define OBJC_MSB_TAGGED_POINTERS 1//iOS开发
#endif

#if OBJC_MSB_TAGGED_POINTERS
#   define _OBJC_TAG_MASK (1UL<<63)
#else
#   define _OBJC_TAG_MASK 1UL
#endif
bool objc_isTaggedPointer(const void * _Nullable ptr)
{
	return ((uintptr_t)ptr & _OBJC_TAG_MASK) == _OBJC_TAG_MASK;
}
- (void)viewDidLoad {
    [super viewDidLoad];
	[self test1];
	[self test2];
}
- (void)test1{
	dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
	for (NSInteger i = 0; i < 1000; i ++) {
		dispatch_async(queue, ^{
			self.name = [NSString stringWithFormat:@"abc"];
//			NSLog(@"test1 class:%@",self.name.class);
		});
	}
}
- (void)test2{
	dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
	for (NSInteger i = 0; i < 1000; i ++) {
		dispatch_async(queue, ^{
			self.name = [NSString stringWithFormat:@"abcsefafaefafafaefe"];
//			NSLog(@"test2 class:%@",self.name.class);
		});
	}
}
@end
