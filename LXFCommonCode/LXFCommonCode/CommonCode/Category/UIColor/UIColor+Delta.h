//
//  UIColor+Delta.h
//  LXFCommonCode
//
//  Created by LinXunFeng on 2019/12/10.
//  Copyright © 2019 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2
//  掘金: https://juejin.im/user/58f8065e61ff4b006646c72d

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Delta)

/**
 16进制颜色转换成UIColor
 
 @param hexColor hex字符串
 @param opacity 透明度
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColor alpha:(float)opacity;

/**
 得到一个颜色的原始值 RGBA
 
 @param originColor 传入颜色
 @return 颜色值数组
 */
+ (NSArray *)getRGBDictionaryByColor:(UIColor *)originColor;

/**
 得到两个值的色差
 
 @param beginColor 起始颜色
 @param endColor 终止颜色
 @return 色差数组
 */
+ (NSArray *)transColorBeginColor:(UIColor *)beginColor andEndColor:(UIColor *)endColor;

/**
 传入两个颜色和系数
 
 @param beginColor 开始颜色
 @param coe 系数（0->1）
 @param endColor 终止颜色
 @return 过度颜色
 */
+ (UIColor *)getColorWithColor:(UIColor *)beginColor andCoe:(double)coe  andEndColor:(UIColor *)endColor;

@end

NS_ASSUME_NONNULL_END
