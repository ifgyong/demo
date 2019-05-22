//
//  DelegateImage.m
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "DelegateImage.h"

@implementation DelegateImage

@end

@implementation RealImage

+ (instancetype)RealImage:(NSString *)fn{
    RealImage *image=[[RealImage alloc]init];
    image.fileName = fn;
    [image loadFromDisk:fn];
    return image;
}
- (void)display {
    NSLog(@"display:%@",self.fileName);
}
- (void)loadFromDisk:(NSString *)fileName{
    NSLog(@"loading:%@",fileName);
}
@end

@implementation ProxyImage

+ (instancetype)ProxyImage:(NSString *)fn{
    ProxyImage *image=[[ProxyImage alloc]init];
    image.fileName = fn;
    return image;
}
- (void)display {
    if (self.realimage == nil) {
        self.realimage =[RealImage RealImage:self.fileName];
    }
    [self.realimage display];
}
- (void)loadFromDisk:(NSString *)fileName{
    NSLog(@"loading:%@",fileName);
}
@end



