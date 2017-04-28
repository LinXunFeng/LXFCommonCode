//
//  LXFCompressImage.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/4/5.
//  Copyright © 2017年 LXF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXFCompressImage : NSObject

//压缩头像
+(UIImage *)compressHeaderImage:(UIImage *)editedImage;

//压缩图片
+(UIImage *)compressImage:(UIImage *)editedImage;

//压缩图片质量
+(UIImage *)reduceImage:(UIImage *)image lenth:(CGFloat)lenth;


@end
