//
//  UIImageView+Circle.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIImageView+Circle.h"

@implementation UIImageView (Circle)

- (void)circleImage{
    UIImage *anotherImage = self.image;
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    //在绘制之前先裁剪出一个圆形
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:50] addClip];
    //图片在设置的圆形里面进行绘制
    [anotherImage drawInRect:self.bounds];
    //获取图片
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束绘制
    UIGraphicsEndImageContext();
}

@end
