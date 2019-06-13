//
//  ViewController.h
//  App
//
//  Created by Charlie on 2019/5/27.
//

#import <UIKit/UIKit.h>
#include "ffi.h"
@interface ViewController : UIViewController


@end
static void fy_rebind(const char * selName,void *replacement,void **replaced);
static void (*fy_viewWillAprea_pro)(void);

static void fy_viewWillAprea(void);
static void hookC(void);
static int add(int,int);
static int plus(void);
static void test(void);
