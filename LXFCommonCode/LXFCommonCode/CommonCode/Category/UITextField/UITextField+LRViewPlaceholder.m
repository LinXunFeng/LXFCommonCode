//
//  UITextField+LRViewPlaceholder.m
//  XGJ-User
//
//  Created by LXF on 16/9/2.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "UITextField+LRViewPlaceholder.h"

#define LeftImageViewWH 24
#define LeftViewW 50
#define LeftViewH 50

@implementation UITextField (LRViewPlaceholder)

// 设置左图标
- (void)setLeftImage:(UIImage *)LeftImage LeftEdge:(CGFloat)LeftEdge {
    // 设置左边的View
    UIImageView *leftImageView = [[UIImageView alloc] initWithImage:LeftImage highlightedImage:nil];
    leftImageView.frame = CGRectMake(0, 0, LeftImageViewWH, LeftImageViewWH);
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    CGFloat centerX = LeftViewW * 0.5;
    if (centerX) {
        centerX += LeftEdge;
    }
    leftImageView.center = CGPointMake(centerX, LeftViewH * 0.5);
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LeftViewW, LeftViewH)];
    [leftView addSubview:leftImageView];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftView;
}
// 设置右图标
- (void)setRightImage:(UIImage *)RightImage {
    // 设置右边的View
    UIImageView *rightImageView = [[UIImageView alloc] initWithImage:RightImage highlightedImage:nil];
    rightImageView.frame = CGRectMake(0, 0, LeftImageViewWH * 2, LeftImageViewWH * 2);
    rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    rightImageView.center = CGPointMake(LeftViewW * 0.5, LeftViewH * 0.5);
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LeftViewW + 10, LeftViewW)];
    [rightView addSubview:rightImageView];
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = rightView;
}
// 设置占位字符颜色
- (void)setPlaceholderColor:(UIColor *)color
{
    // placeholder颜色
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

// 快速创建UITextField
+(UITextField *)initWithText:(NSString *)text placeholder:(NSString *)placeholder font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment frame:(CGRect)frame{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleNone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.textAlignment = textAlignment;
    UIView *view = [[UIView alloc] initWithFrame:(CGRect){0,0,15,textField.frame.size.height}];
    if (textAlignment == NSTextAlignmentLeft) {
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.leftView = view;
    }else if (textAlignment == NSTextAlignmentRight){
        textField.rightViewMode = UITextFieldViewModeAlways;
        textField.rightView = view;
    }
    
    textField.textColor = [UIColor darkGrayColor];
    textField.font = font;
    if (text) {
        textField.text = text;
    }
    if (placeholder) {
        textField.placeholder = placeholder;
    }
    return textField;
}

@end
