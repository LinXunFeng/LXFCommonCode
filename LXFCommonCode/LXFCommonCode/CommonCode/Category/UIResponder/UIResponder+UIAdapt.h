//
//  UIResponder+UIAdapt.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/3.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIResponder (UIAdapt)

CGRect CGAdaptRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
CGPoint CGAdaptPointMake(CGFloat x, CGFloat y);
-(CGFloat)factorAdapt;

@end
