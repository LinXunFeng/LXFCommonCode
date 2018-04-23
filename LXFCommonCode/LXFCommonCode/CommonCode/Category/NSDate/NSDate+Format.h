//
//  NSDate+Format.h
//  LXFCommonCode
//
//  Created by LinXunFeng on 2018/4/23.
//  Copyright © 2018年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2
//  掘金: https://juejin.im/user/58f8065e61ff4b006646c72d

#import <Foundation/Foundation.h>

@interface NSDate (Format)

+ (NSString *)stringWithDateStr:(NSString *)date formatStr:(NSString *)format;
+ (NSDate *)dateWithTimeStr:(NSString *)timeStr;
+ (NSString *)stringWithDate:(NSDate *)date formatStr:(NSString *)format;
+ (NSString *)formatStringWithDate:(NSDate *)date;
// 1-7 星期日 星期一 星期二 ... 星期六
+ (NSInteger)weekdayFromDate:(NSDate *)inputDate;

@end
