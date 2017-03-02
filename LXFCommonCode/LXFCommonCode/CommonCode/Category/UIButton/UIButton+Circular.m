//
//  UIButton+Circular.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIButton+Circular.h"

@implementation UIButton (Circular)

+(UIButton *)initWithTitle:(NSString *)title textColor:(UIColor *)color font:(UIFont *)font frame:(CGRect)frame Radius:(NSInteger)Radius
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setTitleColor:color forState:UIControlStateNormal];
    button.layer.cornerRadius = Radius;
    
    return button;
}


- (void)circularWithR:(NSInteger)Radius;
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = Radius;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 0.8;
}

- (void)circularWithR:(NSInteger)Radius borderWidth:(NSInteger)width borderColor:(UIColor*)color;
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = Radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}


@end
