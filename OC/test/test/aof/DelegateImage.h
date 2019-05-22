//
//  DelegateImage.h
//  test
//
//  Created by Charlie on 2019/5/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ImageProtocol <NSObject>
- (void)display;
@end

@interface RealImage : NSObject<ImageProtocol>
@property (nonatomic,copy) NSString *fileName;
+ (instancetype)RealImage:(NSString *)fn;
- (void)display;
- (void)loadFromDisk:(NSString *)fileName;

@end

@interface ProxyImage : NSObject<ImageProtocol>
@property (nonatomic,strong)RealImage *realimage;
@property (nonatomic,copy) NSString *fileName;
+ (instancetype)ProxyImage:(NSString *)fn;
- (void)display;
@end
@interface DelegateImage : NSObject

@end

NS_ASSUME_NONNULL_END
