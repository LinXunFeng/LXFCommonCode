//
//  LanguageUtils.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "LanguageUtils.h"
#import "UserDefaultsUtils.h"

//系统当前语言
#define User_Language @"userLanguage"

static NSBundle *bundle = nil;


@implementation LanguageUtils

+ (NSBundle *)bundle{
    return bundle;
}

+ (void)initUserLanguage{
    NSString *string = [UserDefaultsUtils valueWithKey:User_Language];
    if (string.length == 0) {
        //获取系统当前语言版本
        //中文:zh-Hans 英文:en
        NSArray *languages = [UserDefaultsUtils valueWithKey:@"AppleLanguages"];
        NSString *current = languages[0];
        [UserDefaultsUtils saveValue:current forKey:User_Language];
    }
    
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}

//获得系统当前语言
+ (NSString *)systemCurrentLanguage{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *current = languages[0];
    return current;
}

//获取应用当前语言
+ (NSString *)userLanguage{
    NSString *language = [UserDefaultsUtils valueWithKey:User_Language];
    return language;
}

+ (void)setUserLanguage:(NSString *)language{
    //改变bundle的值
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
    
    //持久化
    [UserDefaultsUtils saveValue:language forKey:User_Language];
}

//当前系统语言为中文
+ (BOOL)ChineseLanguage{
    if ([[LanguageUtils userLanguage] hasPrefix:@"zh-Hans"]) {
        return YES;
    }
    return NO;
}

//当前系统语言为英文
+ (BOOL)EnglishLanguage{
    if ([[LanguageUtils userLanguage] hasPrefix:@"en"]) {
        return YES;
    }
    return NO;
}

//当前系统语言为泰文
+ (BOOL)ThaiLanguage{
    if ([[LanguageUtils userLanguage] hasPrefix:@"th"]) {
        return YES;
    }
    return NO;
}

@end
