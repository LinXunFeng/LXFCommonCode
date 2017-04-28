//
//  LXFDateUtils.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/4/5.
//  Copyright © 2017年 LXF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXFDateUtils : NSObject

//根据指定时间计算相差的时间
+(NSString *)getTheCreatTimeFromNow:(NSString *)currentDate creatDate:(NSString *)creatDate;
//根据指定格式将NSDate转换为NSString
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter;
//根据指定格式将NSString转换为NSDate
+ (NSDate *)dateFromString:(NSString *)dateString formatter:(NSString *)formatter;
//系统当前时间的时间戳
+ (NSString *)currentTimestamp;
//将服务器返回的10位格式时间戳转换成字符串的时间格式(不带 时分秒)
+(NSString *)changeTimeFormatToDate:(NSString *)date;
//将服务器返回的10位格式时间戳转换成字符串的时间格式(带 时分 不带 秒)
+(NSString *)changeTimeFormatToTime:(NSString *)date;
//根据给定时间戳换算成具体日期12-23 12:52(如果不是当年的日期,会显示年份)
+(NSString *)changeTimeFormatToDetailDate:(NSString *)date;
//根据给定时间戳换算成具体日期,格式为format
+(NSString *)changeTimeFormatToDetailDate:(NSString *)date format:(NSString *)format;
//计算某个时间与当前时间的差值(精确计算)
+(NSString *)compareWithCurrentTimeByAccurate:(NSString *)time;
//计算某个时间与当前时间的差值(不精确计算)
+(NSString *)compareWithCurrentTime:(NSString *)time;

@end
