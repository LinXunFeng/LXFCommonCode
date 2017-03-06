//
//  UIScrollView+ContentFrame.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/5.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIScrollView+ContentFrame.h"

@implementation UIScrollView (ContentFrame)

- (CGFloat)contentWidth
{
    return self.contentSize.width;
}

- (void)setContentWidth:(CGFloat)contentWidth
{
    CGSize contentSize = self.contentSize;
    contentSize.width = contentWidth;
    self.contentSize = contentSize;
}

- (CGFloat)contentHeight
{
    return self.contentSize.height;
}

- (void)setContentHeight:(CGFloat)contentHeight
{
    CGSize contentSize = self.contentSize;
    contentSize.height = contentHeight;
    self.contentSize = contentSize;
}

- (CGFloat)offsetX
{
    return self.contentOffset.x;
}

- (CGFloat)offsetY
{
    return self.contentOffset.y;
}

- (CGFloat)insetTop
{
    return self.contentInset.top;
}

- (void)setInsetTop:(CGFloat)insetTop
{
    UIEdgeInsets insets = self.contentInset;
    insets.top = insetTop;
    self.contentInset = insets;
}

- (CGFloat)insetBottom
{
    return self.contentInset.bottom;
}

- (void)setInsetBottom:(CGFloat)insetBottom
{
    UIEdgeInsets insets = self.contentInset;
    insets.bottom = insetBottom;
    self.contentInset = insets;
}

@end
