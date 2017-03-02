//
//  UITextField+LRViewPlaceholder.h
//  XGJ-User
//
//  Created by LXF on 16/9/2.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LRViewPlaceholder)

// 设置左图标
- (void)setLeftImage:(UIImage *)LeftImage LeftEdge:(CGFloat)LeftEdge;
// 设置占位字符颜色
- (void)setPlaceholderColor:(UIColor *)color;
// 设置右图标
- (void)setRightImage:(UIImage *)RightImage;

// 快速创建UITextField
+(UITextField *)initWithText:(NSString *)text placeholder:(NSString *)placeholder font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment frame:(CGRect)frame;

@end
