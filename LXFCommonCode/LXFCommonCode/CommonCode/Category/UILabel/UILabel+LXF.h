//
//  UILabel+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UILabel (LXF)

+(UILabel *)initWithTitle:(NSString *)title textColor:(UIColor *)color font:(UIFont *)font frame:(CGRect)frame textAlign:(NSTextAlignment)textAlign;

-(UILabel *)setUIWithTitle:(NSString *)title textColor:(UIColor *)color font:(UIFont *)font frame:(CGRect)frame textAlign:(NSTextAlignment)textAlign;

+ (void)setLineSpacing:(CGFloat)spacing label:(UILabel *)label;

+(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW;

@end
