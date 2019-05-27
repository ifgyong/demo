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
    int time = arc4random() %30;
    usleep(100000 * time);
}
@end
