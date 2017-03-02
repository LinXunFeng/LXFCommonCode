//
//  LXFSystem.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2


#import <Foundation/Foundation.h>

@interface LXFSystem : NSObject

/********系统********/
+ (BOOL)isIOS6Later;    //包括IOS6,下同
+ (BOOL)isIOS7Later;
+ (BOOL)isIOS8Later;
+ (BOOL)isIOS9Later;
+ (BOOL)isIOS10Later;

+ (BOOL)isIOS6Early;    //不包括IOS6,下同
+ (BOOL)isIOS7Early;
+ (BOOL)isIOS8Early;
+ (BOOL)isIOS9Early;
+ (BOOL)isIOS10Early;

/********尺寸********/
+ (BOOL)isIPhone35Inch;
+ (BOOL)isIPhone4Inch;
+ (BOOL)isIPhone47Inch;
+ (BOOL)isIPhone55Inch;
+ (BOOL)isIPhone4InchEarly; //include

/********Device Info********/
+ (NSString *)systemVersion;
+ (NSString *)platform;
+ (NSString *)UUID;
+ (BOOL)isJailBroken;
+ (BOOL)isPhone;
+ (BOOL)isPad;

/********APP Info********/
+ (NSString *)appVersion;
+ (NSString *)appIdentifier;
+ (NSString *)systemInfo;

@end
