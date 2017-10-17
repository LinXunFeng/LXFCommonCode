//
//  UIScrollView+ContentFrame.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/5.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIScrollView (ContentFrame)

@property(nonatomic, assign) CGFloat contentWidth;
@property(nonatomic, assign) CGFloat contentHeight;

@property(nonatomic, assign, readonly) CGFloat offsetY;
@property(nonatomic, assign, readonly) CGFloat offsetX;

@property(nonatomic, assign) CGFloat insetTop;
@property(nonatomic, assign) CGFloat insetBottom;
@property (assign, nonatomic) CGFloat insetLeft;
@property (assign, nonatomic) CGFloat insetRight;

@end
