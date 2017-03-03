//
//  UIPopoverController+iPhone.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/3.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

// Runtime implementation to allow UIPopoverController on iPhone apps.

#import <UIKit/UIKit.h>

@interface UIPopoverController (iPhone)

/**
 *  @brief  开启UIPopoverController支持iPhone
 *
 *  @return 开启状态
 */
+ (BOOL)_popoversDisabled;

@end
