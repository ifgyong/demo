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

@interface ViewController ()

@end

@implementation ViewController
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

    hookC();
}
//static void ffi_closure(void){
//
//}
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
