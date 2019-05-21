//
//  MiddlePlayer.m
//  test
//
//  Created by Charlie on 2019/5/20.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "MiddlePlayer.h"

@implementation MiddlePlayer
- (void)play:(NSString *)fileName type:(NSString *)type{/*do nothing*/}
@end
@implementation AdvancedMediaPlayer
- (void)playMp4:(NSString *)name{/*do nothing*/}
- (void)playVLC:(NSString *)name{/*do nothing*/}
@end
@implementation VlcPlayer
- (void)playMp4:(NSString *)name{/*do nothing*/}
- (void)playVLC:(NSString *)name{
    NSLog(@"playVLC");
}
@end
@implementation Mp4Player

- (void)playMp4:(NSString *)name{NSLog(@"playMp4");}
- (void)playVLC:(NSString *)name{/*do nothing*/}
@end
@implementation MediaAdapter

- (void)play:(NSString *)fileName type:(NSString *)type{
    if ([type isEqualToString:@"vlc"]) {
        [VlcPlayer.new playVLC:fileName];
    }else if ([type isEqualToString:@"mp4"]){
        [Mp4Player.new playMp4:fileName];
    }
}

@end

