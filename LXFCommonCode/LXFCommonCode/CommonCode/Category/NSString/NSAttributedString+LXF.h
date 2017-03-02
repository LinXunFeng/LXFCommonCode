//
//  NSAttributedString+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

/**
 *  算富文本的高度
 */
@interface NSAttributedString (LXF)

/** 由于系统计算富文本的高度不正确，自己写了方法 */
- (CGFloat)heightWithContainWidth:(CGFloat)width;

@end
