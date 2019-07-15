//
//  FYPerson.h
//  day10-runtime
//
//  Created by Charlie on 2019/7/15.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYPerson : NSObject

//@property (nonatomic,assign) BOOL rich;
//@property (nonatomic,assign) BOOL tell;
//@property (nonatomic,assign) BOOL handsome;


- (void)setTall:(BOOL)tall;
- (void)setRich:(BOOL)rich;
- (void)setHandsome:(BOOL)handsome;

- (BOOL)isTall;
- (BOOL)isRich;
- (BOOL)isHandsome;
@end

NS_ASSUME_NONNULL_END
