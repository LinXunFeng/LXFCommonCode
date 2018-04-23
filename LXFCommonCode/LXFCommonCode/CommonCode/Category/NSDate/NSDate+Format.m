//
//  NSDate+Format.m
//  LXFCommonCode
//
//  Created by LinXunFeng on 2018/4/23.
//  Copyright © 2018年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2
//  掘金: https://juejin.im/user/58f8065e61ff4b006646c72d

#import "NSDate+Format.h"

@implementation NSDate (Format)

+ (NSString *)stringWithDateStr:(NSString *)date formatStr:(NSString *)format
{
    NSDate *d = [NSDate dateWithTimeStr:date];
    return [NSDate stringWithDate:d formatStr:format];
}

+ (NSDate *)dateWithTimeStr:(NSString *)timeStr
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormat dateFromString:timeStr];
}

+ (NSString *)stringWithDate:(NSDate *)date formatStr:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)formatStringWithDate:(NSDate *)date
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormat stringFromDate:date];
}

+ (NSInteger)weekdayFromDate:(NSDate *)inputDate
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone:timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return theComponents.weekday;
}

@end
