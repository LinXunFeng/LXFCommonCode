//
//  UIView+Color.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/7/11.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIView (Color)

// 获取某点的颜色
- (UIColor *)colorOfPoint:(CGPoint)point;

// 将view的绘制成图片（对webView无法截图十分有效）
- (UIImage*)captureWithFrame:(CGRect)frame;

@end
