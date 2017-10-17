//
//  UIImage+Scale.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

/** 压缩 */
- (UIImage *)scaleToSize:(CGSize)size;

/** 等比例压缩 */
- (UIImage *)imageCompressForSize:(CGSize)size;

/**
 *  返回指定尺寸的图片
 */
- (UIImage *)imageWithScaleSize:(CGSize)scaleSize;


@end
