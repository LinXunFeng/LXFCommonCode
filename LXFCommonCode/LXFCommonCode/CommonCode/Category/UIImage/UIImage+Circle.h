//
//  UIImage+Circle.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIImage (Circle)

/**
 *  将方图片转换成圆图片
 */
+ (UIImage *)circleImageWithOldImage:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (UIImage *)generateCenterImageWithBgColor:(UIColor *)bgImageColor bgImageSize:(CGSize)bgImageSize centerImage:(UIImage *)centerImage;

@end
