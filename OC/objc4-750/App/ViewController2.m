//
//  ViewController2.m
//  App
//
//  Created by Charlie on 2019/5/27.
//

#import "ViewController2.h"

@implementation ViewController2
-(void)dealloc{
    NSLog(@"%s",__func__);
}
- (IBAction)push:(UIButton *)sender {
}
- (IBAction)pop:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewDidLoad{
    [super viewDidLoad];
    int time = arc4random() %30;
    usleep(100000 * time);
}
@end
@implementation ViewController3

@end
