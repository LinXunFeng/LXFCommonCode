//
//  UIImage+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIImage (LXF)

/**
 *  生成一张高斯模糊的图片
 *
 *  @param image 原图
 *  @param blur  模糊程度 (0~1)
 *
 *  @return 高斯模糊图片
 */
+ (UIImage *)blurImage:(UIImage *)image blur:(CGFloat)blur;

/**
 *  根据颜色生成一张图片
 *
 *  @param color 颜色
 *  @param size  图片大小
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  生成圆角的图片
 *
 *  @param originImage 原始图片
 *  @param borderColor 边框原色
 *  @param borderWidth 边框宽度
 *
 *  @return 圆形图片
 */
+ (UIImage *)circleImage:(UIImage *)originImage borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end




/**
 *  常规内容
 */
@interface UIImage (Category)

/** 由颜色生成图片 */
+ (UIImage *) imageWithColor:(UIColor*)color;

/** 将图片剪裁至目标尺寸 */
+ (UIImage *) imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize;

/** 图片旋转角度 */
- (UIImage *) imageRotatedByDegrees:(CGFloat)degrees;

/** 拉伸图片UIEdgeInsets */
- (UIImage *) resizableImage:(UIEdgeInsets)insets;

/** 拉伸图片CGFloat */
- (UIImage *) imageByResizeToScale:(CGFloat)scale;

/** 放大图片CGSize */
- (UIImage *) imageByResizeWithMaxSize:(CGSize)size;

/** 小样图图片CGSize */
- (UIImage *) imageWithThumbnailForSize:(CGSize)size;

/** 通过Rect剪裁图片 */
- (UIImage *) imageByCropToRect:(CGRect)rect;

/** 图片增加圆角 */
- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius;

/** 图片增加圆角及边框 */
- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius
                           borderWidth:(CGFloat)borderWidth
                           borderColor:(UIColor *)borderColor;

/** 图片向左90度 */
// - (UIImage *)imageByRotateLeft90;

/** 图片向右90度 */
// - (UIImage *)imageByRotateRight90;

/** 图片转180度 */
- (UIImage *)imageByRotate180;

@end


@interface UIImage (Blur)
//玻璃化效果，这里与系统的玻璃化枚举效果一样，但只是一张图

/** 玻璃效果：柔和 */
- (UIImage *)imageByBlurSoft;
/** 玻璃效果：亮 */
- (UIImage *)imageByBlurLight;
/** 玻璃效果：高亮 */
- (UIImage *)imageByBlurExtraLight;
/** 玻璃效果：暗 */
- (UIImage *)imageByBlurDark;
/** 玻璃效果：自定义颜色 */
- (UIImage *)imageByBlurWithTint:(UIColor *)tintColor;
/** 玻璃效果：自定义：模糊半径、颜色、模式、饱和度、图片 */
- (UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                     tintColor:(UIColor *)tintColor
                      tintMode:(CGBlendMode)tintBlendMode
                    saturation:(CGFloat)saturation
                     maskImage:(UIImage *)maskImage;
/** 玻璃效果：自定义：半径、排除路径 */
- (UIImage *) boxblurImageWithBlur:(CGFloat)blur exclusionPath:(UIBezierPath *)exclusionPath;
@end



@interface UIImage (ImageEffects)

//图片效果
/** 图片效果：亮 */
- (UIImage *)applyLightEffect;
/** 图片效果：加亮 */
- (UIImage *)applyExtraLightEffect;
/** 图片效果：暗 */
- (UIImage *)applyDarkEffect;
/** 图片效果：模糊 */
- (UIImage *)applyBlurEffect;
/** 图片效果：自定义颜色 */
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
/** 图片效果：自定义：半径、饱和度、图片 */
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;
@end
