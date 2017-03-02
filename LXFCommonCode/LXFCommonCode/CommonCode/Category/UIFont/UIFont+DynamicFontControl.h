//
//  UIFont+DynamicFontControl.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

/**
 *  @Author(作者)         Michael Kral
 *
 *  @URL(地址)            https://github.com/mkral/UIFont-DynamicFontControlDemo
 *
 *  @Version(版本)        20150622
 *
 *  @Requirements(运行要求)
 *
 *  @Description(描述)      Simple Category for using UIFontTextStyle with other Fonts.
 
 *
 *  @Usage(使用) ..
 */

#import <UIKit/UIKit.h>

@interface UIFont (DynamicFontControl)

+(UIFont *)preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName scale:(CGFloat)scale;

+(UIFont *)preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName;



-(UIFont *)adjustFontForTextStyle:(NSString *)style;

-(UIFont *)adjustFontForTextStyle:(NSString *)style scale:(CGFloat)scale;

@end
