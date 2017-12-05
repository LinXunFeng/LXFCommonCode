//
//  UIImage+GIF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

typedef void (^GIFimageBlock)(UIImage *GIFImage);

@interface UIImage (GIF)

/** 根据本地GIF图片名 获得GIF image对象 */
+ (UIImage *)sd_animatedGIFNamed:(NSString *)name;

/** 根据一个GIF图片的data数据 获得GIF image对象 */
+ (UIImage *)sd_animatedGIFWithData:(NSData *)data;

- (UIImage *)sd_animatedImageByScalingAndCroppingToSize:(CGSize)size;

/** 根据一个GIF图片的URL 获得GIF image对象 */
+ (void)sd_imageWithGIFUrl:(NSString *)url and:(GIFimageBlock)gifImageBlock;

@end
