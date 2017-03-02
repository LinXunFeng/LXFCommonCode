//
//  LanguageUtils.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2


#import <Foundation/Foundation.h>

@interface LanguageUtils : NSObject

//获取当前资源文件
+ (NSBundle *)bundle;

//初始化语言文件
+ (void)initUserLanguage;

//获得系统当前语言
+ (NSString *)systemCurrentLanguage;

//获取应用当前语言
+ (NSString *)userLanguage;

//设置当前语言
+ (void)setUserLanguage:(NSString *)language;

//当前系统语言为中文
+ (BOOL)ChineseLanguage;

//当前系统语言为英文
+ (BOOL)EnglishLanguage;

//当前系统语言为泰文
+ (BOOL)ThaiLanguage;


@end
