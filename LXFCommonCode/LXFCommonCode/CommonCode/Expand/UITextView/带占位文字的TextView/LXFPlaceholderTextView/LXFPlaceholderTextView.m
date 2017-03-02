//
//  LXFPlaceholderTextView.m
//  
//
//  Created by LXF on 16/6/19.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "LXFPlaceholderTextView.h"
#import "UIView+Frame.h"

@interface LXFPlaceholderTextView()
/** 占位文字label */
@property(nonatomic, weak) UILabel *placeholderLabel;

@end

@implementation LXFPlaceholderTextView

- (UILabel *)placeholderLabel
{
    if (!_placeholderLabel) {
        // 添加一个用来显示占位文字的label
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.x = 4;
        placeholderLabel.y = 7;
        [self addSubview:placeholderLabel];
        _placeholderLabel = placeholderLabel;
    }
    return _placeholderLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
        
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)setup {
    // 垂直方向上就远有弹簧效果
    self.alwaysBounceVertical = YES;
    
    // 默认字体
    self.font = [UIFont systemFontOfSize:15];
    
    // 默认的占位文字颜色
    self.placeholderColor = [UIColor lightGrayColor];
    
    // 监听文字改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


/**
 *  监听文字改变
 */
- (void)textDidChange
{
    // 只要有文字,就隐藏占位文字label
    self.placeholderLabel.hidden = self.hasText;
}

/**
 *  更新占位文字的尺寸
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeholderLabel.width = self.width - 2 * self.placeholderLabel.x;
    [self.placeholderLabel sizeToFit];
}

#pragma mark - 重写setter
-  (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    self.placeholderLabel.text = placeholder;
    
    [self setNeedsLayout]; // 该方法不会使layoutSubviews立即调用,而是等到当前控件的frame确定后再调用layoutSubviews
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}

/**
 *  setNeedsDisplay : 会在恰当的时刻自动调用drawRect:方法
 *  setNeedsLayout : 会在恰当的时刻调用layoutSubviews方法
 */

@end
