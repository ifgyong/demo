//
//  ViewController.m
//  App
//
//  Created by Charlie on 2019/5/27.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <dlfcn.h>
#import <mach-o/ldsyms.h>
#import "ViewController2.h"
#include <stdio.h>
#include "fishhook/fishhook.h"


@interface ViewController ()

@end

@implementation ViewController
+(void)load{
    NSLog(@"%s cls:%@",__func__,NSStringFromClass(self));
//    fy_rebind("class_replaceMethod",fy_class_replaceMethod,(void*)&ori_class_replaceMethod);
//    fy_rebind("_lookUpImpOrForward", new_lookUpImpOrForward,(void*)&ori_lookUpImpOrForward);
//    fy_rebind("class_replaceMethod",fy_class_replaceMethod_new,(void*)&ori_class_replaceMethod_new);
}
- (IBAction)push:(UIButton *)sender {
    ViewController2 *vc= [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"ViewController2"] ;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)pop:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    int time = arc4random() %30;
//    usleep(100000 * time);

//    hookC();
//    void(^block)(void)=^{
//        NSLog(@"122");
//    };
//    struct Block_layout *layout =(__bridge void*)block;

//    Class cl = object_getClass(self);
//    Class cl3= self.class;
//    Class cl2 = object_getClass(cl3);
//
//    if (cl == cl2) {
//        NSLog(@"cl == cl2");
//    }
//    test();

}
static IMP (*ori_lookUpImpOrForward)(Class cls, SEL sel, id inst,
                       bool initialize, bool cache, bool resolver);
IMP (new_lookUpImpOrForward)(Class cls, SEL sel, id inst,
                                    bool initialize, bool cache, bool resolver){
    NSLog(@"new:%@ sel:%@",NSStringFromClass(cls),NSStringFromSelector(sel));
    return ori_lookUpImpOrForward(cls,sel,inst,initialize,cache,resolver);
}
void fy_rebind(const char * selName,void *replacement,void **replaced){
    struct rebinding ex;
    ex.name = selName;
    ex.replacement = replacement;
    ex.replaced = replaced;
    struct rebinding res[] = {ex};
   int ret = rebind_symbols(res, 1);
    if (ret == 0) {
        NSLog(@"%s did replaced",selName);
    }
    // 初始化方法里进行替换
//    rebind_symbols((struct rebinding[1]){{"NSLog", new_NSLog, (void *)&orig_NSLog}}, 1);
}
static Class (*orig_test)(id _Nullable obj);
Class (new_test)(id _Nullable obj){
    NSLog(@"func:%s %@",__func__,orig_test(obj));
    return ViewController.class;
}
static IMP  (*ori_class_replaceMethod)(Class _Nullable __unsafe_unretained cls,SEL _Nonnull name,IMP _Nonnull imp,const char * _Nullable types);
IMP (fy_class_replaceMethod)(Class _Nullable __unsafe_unretained cls,SEL _Nonnull name,IMP _Nonnull imp,const char * _Nullable types){
    NSLog(@"class:%@ sel:%@ did exchange",NSStringFromClass(cls),NSStringFromSelector(name));
    return ori_class_replaceMethod(cls, name, imp, types);
}
static IMP  (*ori_class_replaceMethod_new)(Class _Nullable __unsafe_unretained cls,SEL _Nonnull name,IMP _Nonnull imp,const char * _Nullable types);
IMP (fy_class_replaceMethod_new)(Class _Nullable __unsafe_unretained cls,SEL _Nonnull name,IMP _Nonnull imp,const char * _Nullable types){
    NSLog(@"cls2:%@ sel2:%@ did exchange",NSStringFromClass(cls),NSStringFromSelector(name));
    return ori_class_replaceMethod(cls, name, imp, types);
}

void test(void){
    NSLog(@"test 来了 老弟！");
}
//static void ffi_closure(void){
//
//}
static void (*orig_NSLog)(NSString *format, ...);
void(new_NSLog)(NSString *format, ...) {
    va_list args;
    if(format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        orig_NSLog(@"_%@", message);
        va_end(args);
    }
}



#define BLOCK_DESCRIPTOR_1 1
struct Block_descriptor_1 {
    unsigned long int reserved;
    unsigned long int size;
};

#define BLOCK_DESCRIPTOR_2 1
struct Block_descriptor_2 {
    // requires BLOCK_HAS_COPY_DISPOSE
    void (*copy)(void *dst, const void *src);
    void (*dispose)(const void *);
};

#define BLOCK_DESCRIPTOR_3 1
struct Block_descriptor_3 {
    // requires BLOCK_HAS_SIGNATURE
    const char *signature;
    const char *layout;
};

struct Block_layout {
    void *isa;
    volatile int flags; // contains ref count
    int reserved;
    void (*invoke)(void *, ...);
    struct Block_descriptor_1 *descriptor;
    // imported variables
};
enum {
    BLOCK_DEALLOCATING =      (0x0001),  // runtime
    BLOCK_REFCOUNT_MASK =     (0xfffe),  // runtime
    BLOCK_NEEDS_FREE =        (1 << 24), // runtime
    BLOCK_HAS_COPY_DISPOSE =  (1 << 25), // compiler
    BLOCK_HAS_CTOR =          (1 << 26), // compiler: helpers have C++ code
    BLOCK_IS_GC =             (1 << 27), // runtime
    BLOCK_IS_GLOBAL =         (1 << 28), // compiler
    BLOCK_USE_STRET =         (1 << 29), // compiler: undefined if !BLOCK_HAS_SIGNATURE
    BLOCK_HAS_SIGNATURE  =    (1 << 30)  // compiler
};
NSString *signatureForBlock(id block) {
    struct Block_layout *layout = (__bridge void *)block;
    if (!(layout->flags & BLOCK_HAS_SIGNATURE))
        return nil;
    
    void *descRef = layout->descriptor;
    descRef += 2 * sizeof(unsigned long int);
    
    if (layout->flags & BLOCK_HAS_COPY_DISPOSE)
        descRef += 2 * sizeof(void *);
    
    if (!descRef)
        return nil;
    
    const char *signature = (*(const char **)descRef);
    return [NSString stringWithUTF8String:signature];
}

static void hookC(void){
    //生成参数的type
    ffi_type **types;
    types = malloc(sizeof(ffi_type *) *2);
    types[0]   = &ffi_type_sint;
    types[1]   = &ffi_type_sint;
    //返回值 type
    ffi_type *retType = &ffi_type_sint;
    //参数数组
    void ** args = malloc(sizeof(void*) *2);
    int x = 10,y=20;
    args[0] = &x;
    args[1] = &y;
    
    int ret;
    ffi_cif cif;
    //生成模板
    ffi_prep_cif(&cif, FFI_DEFAULT_ABI, 2, retType, types);
//    int (*fn2)(void) = plus;
    int (*fn)(int,int);
//    当闭包调用的时候 fn2函数被调用
    ffi_closure *_cloure  = ffi_closure_alloc(sizeof(ffi_closure), &fn);
    ffi_status status =  ffi_prep_closure_loc(_cloure, &cif, plus, stdout, fn);
    if (status == FFI_OK) {
        printf("before plus \n");
        ret = fn(11,22);
        printf("ret:%d \n",ret);
    }
    
    
    //动态调用
    //    &cif 模板
    //    add func
    //    &ret 返回值
    //    args 参数
//    ffi_call(&cif, fn, &ret, args);
//    printf("a=10 b=20 :%d \n",ret);
}
void puts_binding(ffi_cif *cif, unsigned int *ret, void* args[],
                  FILE *stream)
{
//    *ret = fputs(*(char **)args[0], stream);
    printf("puts_binding run\n");
}
static int add(int a ,int b){
    return a + b;
}
static int plus(void){
    return 5;
}

@end
