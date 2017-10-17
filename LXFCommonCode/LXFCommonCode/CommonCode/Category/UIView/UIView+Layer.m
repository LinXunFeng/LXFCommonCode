//
//  UIView+Layer.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIView+Layer.h"

@implementation UIView (Layer)

- (void)setLayerBorderWidth:(CGFloat)layerBorderWidth
{
    self.layer.borderWidth = layerBorderWidth;
    [self _config];
}

- (CGFloat)layerBorderWidth
{
    return self.layer.borderWidth;
}

- (void)setLayerCornerRadius:(CGFloat)layerCornerRadius
{
    self.layer.cornerRadius = layerCornerRadius;
    [self _config];
}

- (CGFloat)layerCornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor
{
    self.layer.borderColor = layerBorderColor.CGColor;
    [self _config];
}

- (UIColor *)layerBorderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)_config
{
    self.layer.masksToBounds = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
}

@end
