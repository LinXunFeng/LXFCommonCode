//
//  UIImageView+FaceAwareFill.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/3.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

// This category applies Aspect Fill content mode to an image and if faces are detected it centers them instead of centering the image just by its geometrical center.

#import <UIKit/UIKit.h>

@interface UIImageView (FaceAwareFill)

//Ask the image to perform an "Aspect Fill" but centering the image to the detected faces
//Not the simple center of the image
- (void) faceAwareFill;

@end
