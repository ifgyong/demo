//
//  FYNodeManger.h
//  VCStatistics
//
//  Created by Charlie on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYNodeMap.h"


NS_ASSUME_NONNULL_BEGIN

@class FYNodeAdpter;

@interface FYNodeManger : NSObject



+ (instancetype)shared;
/**
 添加节点
 */
- (void)appendClsName:(NSString  * )clsName
                  sel:(__nonnull SEL)sel
                  imp:(__nonnull IMP)imp
                types:(const char *)type
              mapType:(FYNodeMapType)tp
				toSel:(__nullable SEL)toSEL;
/**
获取节点
*/
- (FYNodeAdpter * )objectForSEL:(NSString *)selName;

/**
 获取节点
 */
+ (FYNodeAdpter * )objectForSEL:(NSString *)selName;
@end



 
NS_ASSUME_NONNULL_END
