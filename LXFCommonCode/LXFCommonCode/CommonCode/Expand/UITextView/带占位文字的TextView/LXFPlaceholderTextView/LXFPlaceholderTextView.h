//
//  LXFPlaceholderTextView.h
//
//
//  Created by LXF on 16/6/19.
//  Copyright © 2016年 林洵锋. All rights reserved.
//  拥有占位文字功能的TextView控件

#import <UIKit/UIKit.h>

@interface LXFPlaceholderTextView : UITextView
/** 占位文字 */
@property(nonatomic, copy) NSString *placeholder;
/** 占位文字的颜色 */
@property(nonatomic, strong) UIColor *placeholderColor;
@end

/*
 UITextField *textField默认的情况
 1.只能显示一行文字
 2.有占位文字
 
 UITextView *textView默认的情况
 1.能显示任意行文字
 2.没有占位文字
 
 文本输入控件,最终希望拥有的功能
 1.能显示任意行文字
 2.有占位文字
 
 最终的方案:
 1.继承自UITextView
 2.在UITextView能显示任意行文字的基础上,增加"有占位文字"的功能
 */