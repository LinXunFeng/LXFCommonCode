//
//  UILabel+LXF.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UILabel+LXF.h"

@implementation UILabel (LXF)

+(UILabel *)initWithTitle:(NSString *)title textColor:(UIColor *)color font:(UIFont *)font frame:(CGRect)frame textAlign:(NSTextAlignment)textAlign
{
    UILabel *label = [[UILabel alloc] initWithFrame:(CGRect){0,0,100,40}];
    label.text = title;
    label.font = font;
    label.textColor = color;
    label.textAlignment = textAlign;
    
    if (CGRectEqualToRect(frame, CGRectZero)) {
        [label sizeThatFits:label.bounds.size];
        [label sizeToFit];
    }else{
        label.frame = frame;
    }
    return label;
}

- (UIView *)setUIWithFrame:(CGRect)frame backgroundolor:(UIColor *)color{
    self.frame = frame;
    self.backgroundColor = color;
    return self;
}
-(UILabel *)setUIWithTitle:(NSString *)title textColor:(UIColor *)color font:(UIFont *)font frame:(CGRect)frame textAlign:(NSTextAlignment)textAlign
{
    self.frame = (CGRect){0,0,100,40};
    
    self.text = title;
    
    self.font = font;
    
    self.textColor = color;
    
    self.textAlignment = textAlign;
    
    if (CGRectEqualToRect(frame, CGRectZero)) {
        
        [self sizeThatFits:self.bounds.size];
        
        [self sizeToFit];
        
    }else{
        
        self.frame = frame;
        
    }
    return self;
}


+ (void)setLineSpacing:(CGFloat)spacing label:(UILabel *)label
{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    if (label.attributedText) {
        attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:label.attributedText];
    }
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    [label setAttributedText:attributedString];
    [label sizeToFit];
}

//文本高度自适应
+(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
    attrs[NSFontAttributeName]=font;
    
    CGSize maxSize=CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
