//
//  MiddlePlayer.h
//  test
//
//  Created by Charlie on 2019/5/20.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MiddlePlayer : NSObject
- (void)play:(NSString *)fileName type:(NSString *)type;
@end

@interface AdvancedMediaPlayer : NSObject
- (void)playMp4:(NSString *)name;
- (void)playVLC:(NSString *)name;
@end

@interface VlcPlayer : AdvancedMediaPlayer

@end
@interface Mp4Player : AdvancedMediaPlayer

@end
@interface MediaAdapter : MiddlePlayer

@end
NS_ASSUME_NONNULL_END
