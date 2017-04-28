//
//  UIView+Xib.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/24.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIView (Xib)

/**
 *  加载xib视图
 *
 *  @return 返回对应类的xib视图
 */
+ (instancetype)viewFromXib;

@end
