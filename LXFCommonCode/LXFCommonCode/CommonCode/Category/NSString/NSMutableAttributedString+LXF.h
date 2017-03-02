//
//  NSMutableAttributedString+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  富文本高度、文字与图片混合的富文本
 */
@interface NSMutableAttributedString (LXF)

//直接返回NSAttributedString

+ (NSAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString
                                           suffixString:(NSString *)suffixString;


/**
 *  直接返回NSAttributedString
 *
 *  @param prefixString 前面的string
 *  @param prefixFont   字体大小
 *  @param prefixColor  字体颜色
 *  @param suffixString 后面拼接的string
 *  @param suffixFont   字体大小
 *  @param suffixColor  字体颜色
 *
 *  @return 直接返回NSAttributedString
 */
+ (NSAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString
                                             prefixFont:(CGFloat)prefixFont
                                            prefixColor:(UInt32)prefixColor
                                           suffixString:(NSString *)suffixString
                                             suffixFont:(CGFloat)suffixFont
                                            suffixColor:(UInt32)suffixColor;

/** string在前 图片在后 */
+ (NSMutableAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString
                                              subffixImageName:(NSString *)subffixImageName;


/** 图片在前 string在后 */
+ (NSMutableAttributedString *)attributeStringWithSubffixString:(NSString *)subffixString
                                                prefixImageName:(NSString *)prefixImageName;



@end
