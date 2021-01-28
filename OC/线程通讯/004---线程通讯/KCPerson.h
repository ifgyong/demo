//
//  KCPerson.h
//  004---线程通讯
//
//  Created by Cooci on 2018/8/26.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCPerson : NSObject
- (void)personLaunchThreadWithPort:(NSPort *)port;
@end
