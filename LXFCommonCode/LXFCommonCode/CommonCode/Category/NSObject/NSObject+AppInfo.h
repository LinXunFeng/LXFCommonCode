//
//  NSObject+AppInfo.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

@interface NSObject (AppInfo)

-(NSString *)ai_version;
-(NSInteger)ai_build;
-(NSString *)ai_identifier;
-(NSString *)ai_currentLanguage;
-(NSString *)ai_deviceModel;

@end
