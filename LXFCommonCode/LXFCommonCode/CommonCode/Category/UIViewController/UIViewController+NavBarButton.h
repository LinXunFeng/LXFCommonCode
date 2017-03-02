//
//  UIViewController+NavBarButton.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIViewController (NavBarButton)

/** 设置导航栏 - 左边返回按钮 */
- (void)setReturnButtonWithImage:(UIImage *)returnImage;

/** 设置导航栏 - 中间标题 */
- (void)setTitleWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font;

@end
