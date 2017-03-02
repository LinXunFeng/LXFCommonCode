//
//  UIScrollView+SpringHeadView.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

//headView 的高度
#define SpringHeadViewHeight 200

@interface UIScrollView (SpringHeadView)

- (void)addSpringHeadView:(UIView *)view;

@end
