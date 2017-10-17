//
//  UIImage+Circle.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIImage+Circle.h"
#import "UIImage+Color.h"

@implementation UIImage (Circle)

/**
 *  将方图片转换成圆图片
 */
+ (UIImage *)circleImageWithOldImage:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.开启上下文
    CGFloat border = borderWidth;
    CGFloat imageW = oldImage.size.width + 2 * border;
    CGFloat imageH = oldImage.size.height + 2 * border;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    // 2.取出当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5;
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
    
    // 小圆
    CGFloat smallRadius = bigRadius - border;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, 2 * M_PI, 0);
    CGContextClip(ctx);
    
    // 画图
    [oldImage drawInRect:CGRectMake(border, border, oldImage.size.width, oldImage.size.height)];
    
    // 取图
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}

+ (UIImage *)generateCenterImageWithBgColor:(UIColor *)bgImageColor bgImageSize:(CGSize)bgImageSize centerImage:(UIImage *)centerImage
{
    UIImage *bgImage = [UIImage imageWithColor:bgImageColor size:bgImageSize];
    UIGraphicsBeginImageContext(bgImage.size);
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    [centerImage drawInRect:CGRectMake((bgImage.size.width - centerImage.size.width) * 0.5, (bgImage.size.height - centerImage.size.height) * 0.5, centerImage.size.width, centerImage.size.height)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

@end
