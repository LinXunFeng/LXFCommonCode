//
//  UITextField+LXF.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UITextField+LXF.h"

@implementation UITextField (LXF)

+(UITextField *)initWithText:(NSString *)text placeholder:(NSString *)placeholder font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment frame:(CGRect)frame{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleNone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.textAlignment = textAlignment;
    UIView *view = [[UIView alloc] initWithFrame:(CGRect){0,0,15,textField.bounds.size.height}];
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
