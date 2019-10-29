//
//  UIViewController+interactive.m
//  iOSDemo
//
//  Created by 李 on 2019/1/24.
//  Copyright © 2019 yangkun. All rights reserved.
//

#import "UIViewController+interactive.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "FYKVOObserver.h"
#import "FYKVORemover.h"

static char const kAssociatedRemoverKey;

static NSString *const kUniqueFakeKeyPath = @"fy_useless_key_path";

@implementation UIViewController (interactive)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [UIViewController class];
        [self swizzleMethodInClass:class
					originalMethod:@selector(initWithNibName:bundle:)
				  swizzledSelector:@selector(fy_initWithNibName:bundle:)];
        [self swizzleMethodInClass:class
					originalMethod:@selector(initWithCoder:)
				  swizzledSelector:@selector(fy_initWithCoder:)];
    });
}

- (instancetype)fy_initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    [self createAndHookKVOClass];
    [self fy_initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (nullable instancetype)fy_initWithCoder:(NSCoder *)aDecoder {
    [self createAndHookKVOClass];
    [self fy_initWithCoder:aDecoder];
    return self;
}

- (void)createAndHookKVOClass {
    // Setup KVO, which trigger runtime to create the KVO subclass of VC.
    [self addObserver:[FYKVOObserver shared] forKeyPath:kUniqueFakeKeyPath options:NSKeyValueObservingOptionNew context:nil];
    
    // Setup remover of KVO, automatically remove KVO when VC dealloc.
    FYKVORemover *remover = [[FYKVORemover alloc] init];
    remover.target = self;
    remover.keyPath = kUniqueFakeKeyPath;
    objc_setAssociatedObject(self, &kAssociatedRemoverKey, remover, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // NSKVONotifying_ViewController
    Class kvoCls = object_getClass(self);
    
    // Compare current Imp with our Imp. Make sure we didn't hooked before.
    IMP currentViewDidLoadImp = class_getMethodImplementation(kvoCls, @selector(viewDidLoad));
    if (currentViewDidLoadImp == (IMP)fy_viewDidLoad) {
        return;
    }
    
    // ViewController
    Class originCls = class_getSuperclass(kvoCls);
    
    // 获取原来实现的encoding
//    const char *originLoadViewEncoding = method_getTypeEncoding(class_getInstanceMethod(originCls, @selector(loadView)));
    const char *originViewDidLoadEncoding = method_getTypeEncoding(class_getInstanceMethod(originCls, @selector(viewDidLoad)));
    const char *originViewWillAppearEncoding = method_getTypeEncoding(class_getInstanceMethod(originCls, @selector(viewWillAppear:)));
    const char *originViewDidAppearEncoding = method_getTypeEncoding(class_getInstanceMethod(originCls, @selector(viewDidAppear:)));
    
    const char *originViewWillDisappearEncoding = method_getTypeEncoding(class_getInstanceMethod(originCls, @selector(viewWillDisappear:)));
    const char *originViewDidDisappearEncoding = method_getTypeEncoding(class_getInstanceMethod(originCls, @selector(viewDidDisappear:)));

    
    // 重点，添加方法。
//    class_addMethod(kvoCls, @selector(loadView), (IMP)yq_loadView, originLoadViewEncoding);
    class_addMethod(kvoCls, @selector(viewDidLoad), (IMP)fy_viewDidLoad, originViewDidLoadEncoding);
    class_addMethod(kvoCls, @selector(viewWillAppear:), (IMP)fy_viewWillAppear, originViewWillAppearEncoding);
    class_addMethod(kvoCls, @selector(viewDidAppear:), (IMP)fy_viewDidAppear, originViewDidAppearEncoding);
    
    class_addMethod(kvoCls, @selector(viewWillDisappear:), (IMP)fy_viewWillDisappear, originViewWillDisappearEncoding);
    class_addMethod(kvoCls, @selector(viewDidDisappear:), (IMP)fy_viewDidDisappear, originViewDidDisappearEncoding);

    
    
}

+ (void)swizzleMethodInClass:(Class) class originalMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}



#pragma mark - IMP of Key Method
static void fy_viewDidLoad(UIViewController *kvo_self, SEL _sel) {
    Class kvo_cls = object_getClass(kvo_self);
    Class origin_cls = class_getSuperclass(kvo_cls);
    IMP origin_imp = method_getImplementation(class_getInstanceMethod(origin_cls, _sel));
    assert(origin_imp != NULL);
    
    void (*func)(UIViewController *, SEL) = (void (*)(UIViewController *, SEL))origin_imp;
    
    CFAbsoluteTime beginTime = CFAbsoluteTimeGetCurrent();
    
    func(kvo_self, _sel);
    
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
 	flush(beginTime, endTime,kvo_self, NSStringFromSelector(_sel));
}

static void fy_viewWillAppear(UIViewController *kvo_self, SEL _sel, BOOL animated) {
    Class kvo_cls = object_getClass(kvo_self);
    Class origin_cls = class_getSuperclass(kvo_cls);
    
    IMP origin_imp = method_getImplementation(class_getInstanceMethod(origin_cls, _sel));
    assert(origin_imp != NULL);
    
    void (*func)(UIViewController *, SEL, BOOL) = (void (*)(UIViewController *, SEL, BOOL))origin_imp;
    
     CFAbsoluteTime beginTime = CFAbsoluteTimeGetCurrent();
    
    func(kvo_self, _sel, animated);
    
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
	flush(beginTime, endTime,kvo_self, NSStringFromSelector(_sel));
}

static void fy_viewDidAppear(UIViewController *kvo_self, SEL _sel, BOOL animated) {
    Class kvo_cls = object_getClass(kvo_self);
    Class origin_cls = class_getSuperclass(kvo_cls);
    IMP origin_imp = method_getImplementation(class_getInstanceMethod(origin_cls, _sel));
    assert(origin_imp != NULL);
    
    void (*func)(UIViewController *, SEL, BOOL) = (void (*)(UIViewController *, SEL, BOOL))origin_imp;
    
    
    CFAbsoluteTime beginTime = CFAbsoluteTimeGetCurrent();
    
    func(kvo_self, _sel, animated);
    
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
	flush(beginTime, endTime,kvo_self, NSStringFromSelector(_sel));
}

static void fy_viewWillDisappear(UIViewController *kvo_self, SEL _sel, BOOL animated) {
    Class kvo_cls = object_getClass(kvo_self);
    Class origin_cls = class_getSuperclass(kvo_cls);
    IMP origin_imp = method_getImplementation(class_getInstanceMethod(origin_cls, _sel));
    assert(origin_imp != NULL);
    
    void (*func)(UIViewController *, SEL, BOOL) = (void (*)(UIViewController *, SEL, BOOL))origin_imp;
    
    
     CFAbsoluteTime beginTime = CFAbsoluteTimeGetCurrent();
    
    func(kvo_self, _sel, animated);
    
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
	flush(beginTime, endTime,kvo_self, NSStringFromSelector(_sel));


}

static void fy_viewDidDisappear(UIViewController *kvo_self, SEL _sel, BOOL animated) {
    Class kvo_cls = object_getClass(kvo_self);
    Class origin_cls = class_getSuperclass(kvo_cls);
    IMP origin_imp = method_getImplementation(class_getInstanceMethod(origin_cls, _sel));
    assert(origin_imp != NULL);
    
    void (*func)(UIViewController *, SEL, BOOL) = (void (*)(UIViewController *, SEL, BOOL))origin_imp;
     CFAbsoluteTime beginTime = CFAbsoluteTimeGetCurrent();
    func(kvo_self, _sel, animated);
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
	
	flush(beginTime, endTime,kvo_self, NSStringFromSelector(_sel));
}
static void flush(CFAbsoluteTime beginTime, CFAbsoluteTime endTime,UIViewController *kvo_self, NSString *funcName){
	CFTimeInterval dis = endTime - beginTime;
	NSDate *date =[NSDate new];
	NSDateFormatter *formatter = getFormatter();
	NSString * str = [formatter stringFromDate:date];
	const char *clsName = NSStringFromClass(kvo_self.class).UTF8String;
	if(dis > 0.001){
		printf("cls:%s func:%s %f %s \n",clsName,funcName.UTF8String,dis,str.UTF8String);
	}
}
static NSDateFormatter *getFormatter(){
	static NSDateFormatter *formatter;
	if (formatter == nil) {
		formatter=[[NSDateFormatter alloc]init];
		formatter.locale =[NSLocale autoupdatingCurrentLocale];
		[formatter setDateFormat:@"yyyy MM-dd HH:mm:ss"];
	}
	return formatter;
}

@end
