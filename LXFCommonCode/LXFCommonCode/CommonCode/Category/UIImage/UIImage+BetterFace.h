//
//  UIImage+BetterFace.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BFAccuracy) {
    kBFAccuracyLow = 0,
    kBFAccuracyHigh,
};

@interface UIImage (BetterFace)

- (UIImage *)betterFaceImageForSize:(CGSize)size
                           accuracy:(BFAccuracy)accurary;

@end
