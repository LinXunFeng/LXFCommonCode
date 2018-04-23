//
//  UITabBar+Badge.h
//  LXFCommonCode
//
//  Created by LinXunFeng on 2018/4/23.
//  Copyright © 2018年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2
//  掘金: https://juejin.im/user/58f8065e61ff4b006646c72d

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

- (void)showBadgeOnItemIndex:(int)index;
- (void)hideBadgeOnItemIndex:(int)index;

@end
