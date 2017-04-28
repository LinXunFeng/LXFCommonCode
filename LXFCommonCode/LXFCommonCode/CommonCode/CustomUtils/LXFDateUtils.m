//
//  LXFDateUtils.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/4/5.
//  Copyright © 2017年 LXF. All rights reserved.
//

#import "LXFDateUtils.h"

@implementation LXFDateUtils

+(NSString *)getTheCreatTimeFromNow:(NSString *)currentDate creatDate:(NSString *)creatDate
{
    long time = [currentDate doubleValue]/1000-[creatDate doubleValue]/1000;
    NSString *timeForNow = nil;
    if (time<60) {
        timeForNow = @"刚刚";//MultiLanguage(@"JustNow");
    }else if(time<60*60){
        timeForNow = [NSString stringWithFormat:@"%ld%@",time/60,@"分钟前"];//MultiLanguage(@"MinutesAgo")];
    }else if (time<60*60*24){
        timeForNow = [NSString stringWithFormat:@"%ld%@",time/(60*60),@"小时前"];//MultiLanguage(@"HoursAgo")];
    }else{
        NSDate * dateForNow = [NSDate dateWithTimeIntervalSince1970:[currentDate doubleValue]];
        if (currentDate.length == 13) {
            NSTimeInterval interval = [currentDate doubleValue]/1000.0;
            dateForNow = [NSDate dateWithTimeIntervalSince1970:interval];
        }
        NSDate * dateForCreat = [NSDate dateWithTimeIntervalSince1970:[creatDate doubleValue]];
        if (creatDate.length == 13) {
            NSTimeInterval interval = [creatDate doubleValue]/1000.0;
            dateForCreat = [NSDate dateWithTimeIntervalSince1970:interval];
        }
        NSString *strForNow = [self stringFromDate:dateForNow formatter:@"yyyyMMdd"];
        NSString *strForCreat = [self stringFromDate:dateForCreat formatter:@"yyyyMMdd"];
        NSInteger day = [strForNow integerValue]-[strForCreat integerValue];
        if (day<2) {
            timeForNow = @"1天前";
        }else if (day<3){
            timeForNow = @"2天前";
        }else{
            timeForNow = [LXFDateUtils changeTimeFormatToDetailDate:creatDate];
        }
    }
    return timeForNow;
}
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)dateString formatter:(NSString *)formatter;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter dateFromString:dateString];
}

//系统当前时间的时间戳
+ (NSString *)currentTimestamp{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970]*1000;
    NSString *time = [NSString stringWithFormat:@"%.0f",interval];
    return time;
}

//将服务器返回的10位格式时间戳转换成字符串的时间格式(不带 时分秒)
+(NSString *)changeTimeFormatToDate:(NSString *)date
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate * dateStr = [NSDate dateWithTimeIntervalSince1970:[date doubleValue]];
    if (date.length == 13) {
        NSTimeInterval interval = [date doubleValue]/1000.0;
        dateStr = [NSDate dateWithTimeIntervalSince1970:interval];
    }
    
    NSString * dateString = [formatter stringFromDate:dateStr];
    formatter = nil;
    
    return dateString;
    
}

//将服务器返回的10位格式时间戳转换成字符串的时间格式(带 时分  不带 秒 )
+(NSString *)changeTimeFormatToTime:(NSString *)date
{
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    //    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSDate * dateStr = [NSDate dateWithTimeIntervalSince1970:[date doubleValue]];
    if (date.length == 13) {
        NSTimeInterval interval = [date doubleValue]/1000.0;
        dateStr = [NSDate dateWithTimeIntervalSince1970:interval];
    }
    
    NSString * dateString = [formatter stringFromDate:dateStr];
    formatter = nil;
    
    return dateString;
    
}
//根据给定时间戳换算成具体日期12-23 12:52(如果不是当年的日期,会显示年份)
+(NSString *)changeTimeFormatToDetailDate:(NSString *)date{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    NSDate * dateStr = [NSDate dateWithTimeIntervalSince1970:[date doubleValue]];
    if (date.length == 13) {
        NSTimeInterval interval = [date doubleValue]/1000.0;
        dateStr = [NSDate dateWithTimeIntervalSince1970:interval];
    }
    NSString *yearForNow = [self stringFromDate:[NSDate date] formatter:@"yyyy"];
    NSString *currentYear = [self stringFromDate:dateStr formatter:@"yyyy"];
    if ([currentYear isEqualToString:yearForNow]) {
        [formatter setDateFormat:@"MM-dd HH:mm"];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
    
    NSString * dateString = [formatter stringFromDate:dateStr];
    formatter = nil;
    
    return dateString;
}

+(NSString *)changeTimeFormatToDetailDate:(NSString *)date format:(NSString *)format{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    NSDate * dateStr = [NSDate dateWithTimeIntervalSince1970:[date doubleValue]];
    if (date.length == 13) {
        NSTimeInterval interval = [date doubleValue]/1000.0;
        dateStr = [NSDate dateWithTimeIntervalSince1970:interval];
    }
    [formatter setDateFormat:format];
    
    NSString * dateString = [formatter stringFromDate:dateStr];
    formatter = nil;
    
    return dateString;
}

// 计算某个时间与当前时间的差值(精确计算)
+(NSString *)compareWithCurrentTimeByAccurate:(NSString *)time
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate * date = [NSDate date];
    NSDate * compareDate = [formatter dateFromString:time];
    
    //时区问题
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    
    NSDate * localDate = [date dateByAddingTimeInterval:interval];
    compareDate = [compareDate dateByAddingTimeInterval:interval];
    
    formatter = nil;
    
    NSTimeInterval compareInterval = [compareDate timeIntervalSince1970]*1;
    NSTimeInterval nowInterval = [localDate timeIntervalSince1970]*1;
    NSTimeInterval cha = nowInterval - compareInterval;
    
    NSString * result;
    
    if (cha/3600 < 1) {
        result = [NSString stringWithFormat:@"%f",cha/60];
        //去掉小数点后的长度
        result = [result substringToIndex:result.length-7];
        result = [NSString stringWithFormat:@"%@分钟前",result];
    }
    if (cha/60 < 1) {
        result = @"刚刚";
    }
    if (cha/3600 > 1 && cha/86400 < 1) {
        result = [NSString stringWithFormat:@"%f",cha/3600];
        result = [result substringToIndex:result.length - 7];
        result = [NSString stringWithFormat:@"%@小时前",result];
    }
    if (cha/86400 > 1) {
        result = [NSString stringWithFormat:@"%f",cha/86400];
        result = [result substringToIndex:result.length - 7];
        result = [NSString stringWithFormat:@"%@天前",result];
    }
    if (cha/(86400*30)>1) {
        result = [time substringToIndex:10];
    }
    
    return result;
}

// 计算某个时间与当前时间的差值(不精确计算)
+(NSString *)compareWithCurrentTime:(NSString *)time
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * result;
    
    //时区问题
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    
    NSDate * localDate = [[NSDate date] dateByAddingTimeInterval:interval];
    NSDate * compareDate = [[formatter dateFromString:time] dateByAddingTimeInterval:interval];
    
    NSString * today = [formatter stringFromDate:[NSDate date]];
    NSString * today_date = [NSString stringWithFormat:@"%@ 00:00:00",[today substringToIndex:10]];
    NSDate * date1 = [[formatter dateFromString:today_date] dateByAddingTimeInterval:interval];
    formatter = nil;
    
    NSTimeInterval compareInterval = [compareDate timeIntervalSince1970]*1;
    NSTimeInterval nowInterval = [localDate timeIntervalSince1970]*1;
    
    NSTimeInterval date1Interval = [date1 timeIntervalSince1970]*1;
    
    NSTimeInterval date2Interval = date1Interval - (60*60*24);
    
    NSTimeInterval cha = nowInterval - compareInterval;
    
    if (compareInterval >= date1Interval && compareInterval <= nowInterval) {
        result = @"今天";
    }
    else if (compareInterval >= date2Interval && compareInterval < date1Interval) {
        result = @"昨天";
    }
    else if (cha/86400 > 1) {
        result = [NSString stringWithFormat:@"%f",cha/86400];
        result = [result substringToIndex:result.length - 7];
        result = [NSString stringWithFormat:@"%@天前",result];
    }
    if (cha/(86400*30) > 1) {
        result = [time substringToIndex:10];
    }
    
    return result;
}

@end
