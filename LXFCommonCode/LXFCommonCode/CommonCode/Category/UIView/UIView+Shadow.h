//
//  UIView+Shadow.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIView (Shadow)

// 内
- (void) makeInsetShadow;
- (void) makeInsetShadowWithRadius:(float)radius Alpha:(float)alpha;
- (void) makeInsetShadowWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions;

// 外
- (void)makeShadow;
- (void)makeShadowWithRadius:(CGFloat)radius Alpha:(CGFloat)alpha;
- (void)makeShadowWithRadius:(CGFloat)radius Color:(UIColor *)color Offset:(CGSize)offset Alpha:(CGFloat)alpha;


@end
