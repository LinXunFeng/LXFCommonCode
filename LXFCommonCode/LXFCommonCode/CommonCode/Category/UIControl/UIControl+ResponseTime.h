//
//  UIControl+ResponseTime.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIControl (ResponseTime)
/** 相应时间 */
@property(assign,nonatomic)NSTimeInterval responseTime;
@end
