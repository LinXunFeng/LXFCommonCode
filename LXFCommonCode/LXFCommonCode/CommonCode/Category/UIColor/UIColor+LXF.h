//
//  UIColor+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIColor (LXF)

/** 十六进制和透明度 */
+ (UIColor *)colorWithHex:(uint)hex alpha:(CGFloat)alpha;
/** 十六进制字符串转颜色 */
+ (UIColor *)colorWithHexString:(NSString *)HexString;
/** 颜色亮度 */
+ (UIColor*) colorRGBonvertToHSB:(UIColor*)color withBrighnessDelta:(CGFloat)delta;
/** 颜色透明度 */
+ (UIColor*) colorRGBonvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta;
/** 十六进制 */
+ (UIColor*) colorWithHex:(NSInteger)hexValue;

@end
