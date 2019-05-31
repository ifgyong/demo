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

static void hookC(void);
static int add(int,int);
static int plus(void);
