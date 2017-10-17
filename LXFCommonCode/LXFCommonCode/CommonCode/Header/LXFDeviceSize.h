//
//  LXFDeviceSize.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#ifndef LXFDeviceSize_h
#define LXFDeviceSize_h

#pragma mark - 屏幕宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#pragma mark - 视图宽高与坐标
//获取任意一个视图的宽度
#define KViewWidth(a) ((a).bounds.size.width)
//获取任意一个视图的高度
#define KViewHeight(a) ((a).bounds.size.height)
//获取任意一个视图的X坐标
#define KViewOrignalX(a) ((a).frame.origin.x)
//获取任意一个视图的Y坐标
#define KViewOrignalY(a) ((a).frame.origin.y)

#pragma mark - 设备型号
#define IS_IPHONE_4 (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)480)< DBL_EPSILON)
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)568)< DBL_EPSILON)
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)667)< DBL_EPSILON)
#define IS_IPHONE_6P (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)736)< DBL_EPSILON)
#define IS_IPHONE_X (SCREEN_WIDTH == Double(375.0) && SCREEN_HEIGHT == Double(812.0) ?true:false)

#pragma mark - 设备版本
#define IOS_7_OR_LATER  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS_8_OR_LATER  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS_9_OR_LATER  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#endif /* LXFDeviceSize_h */
