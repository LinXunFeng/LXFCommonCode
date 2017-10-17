//
//  UIView+Layer.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIView (Layer)

@property (nonatomic, assign) CGFloat layerCornerRadius;

@property (nonatomic, assign) CGFloat layerBorderWidth;

@property (nonatomic, strong) UIColor *layerBorderColor;

@end
