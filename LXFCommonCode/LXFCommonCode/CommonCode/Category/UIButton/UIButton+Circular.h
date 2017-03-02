//
//  UIButton+Circular.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIButton (Circular)

+(UIButton *)initWithTitle:(NSString *)title textColor:(UIColor *)color font:(UIFont *)font frame:(CGRect)frame Radius:(NSInteger)Radius;

- (void)circularWithR:(NSInteger)Radius;
- (void)circularWithR:(NSInteger)Radius borderWidth:(NSInteger)width borderColor:(UIColor*)color;


@end
