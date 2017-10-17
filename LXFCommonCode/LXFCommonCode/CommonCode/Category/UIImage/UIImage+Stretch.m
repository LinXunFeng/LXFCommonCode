//
//  UIImage+Stretch.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIImage+Stretch.h"

@implementation UIImage (Stretch)

/**
 *  返回拉伸后的图片,默认为从中点拉伸
 */
+ (UIImage *)resizeImageWithName:(NSString *)imageName {
    return [self resizeImageWithName:imageName edgeInsets:UIEdgeInsetsZero];
}

/**
 *  返回拉伸后的图片,指定拉伸位置
 */
+ (UIImage *)resizeImageWithName:(NSString *)imageName edgeInsets:(UIEdgeInsets)edgeInsets {
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch];
    return image;
}


@end
