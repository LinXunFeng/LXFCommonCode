//
//  UIResponder+UIAdapt.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/3.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIResponder+UIAdapt.h"
#define XIB_WIDTH 320

@implementation UIResponder (UIAdapt)

CGRect CGAdaptRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    //UIScreenMode *currentMode = [[UIScreen mainScreen]currentMode];
    CGRect sreenBounds = [UIScreen mainScreen].bounds;
    CGFloat scale  = sreenBounds.size.width/XIB_WIDTH;
    return CGRectMake(x*scale, y*scale, width *scale, height*scale);
}

CGPoint CGAdaptPointMake(CGFloat x, CGFloat y){
    //UIScreenMode *currentMode = [[UIScreen mainScreen]currentMode];
    CGRect sreenBounds = [UIScreen mainScreen].bounds;
    CGFloat scale  = sreenBounds.size.width/XIB_WIDTH;
    return CGPointMake(x*scale, y*scale);
}

-(CGFloat)factorAdapt{
    //IScreenMode *currentMode = [[UIScreen mainScreen]currentMode];
    CGRect sreenBounds = [UIScreen mainScreen].bounds;
    CGFloat scale  = sreenBounds.size.width/XIB_WIDTH;
    return scale;
}

@end
