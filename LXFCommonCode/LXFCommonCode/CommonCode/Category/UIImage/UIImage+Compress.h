//
//  UIImage+Compress.h
//  YouKa
//
//  Created by 林洵锋 on 2018/1/10.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIImage (Compress)


/**
 自动分级压缩（压缩图片至100k以下）

 @return 压缩后的图片
 */
- (UIImage *)autoCompress;


/**
 压缩图片（自己解决级别）

 @param scale 0.0～1.0
 @return 压缩后的图片
 */
- (UIImage *)compressWithScale:(CGFloat)scale;

@end
