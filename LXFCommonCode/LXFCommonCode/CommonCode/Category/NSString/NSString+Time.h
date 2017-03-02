//
//  NSString+Time.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

/**
 *  从时间戳转为显示时间
 */
@interface NSString (Time)

/** 通过时间戳计算时间差（几小时前、几天前） */
+ (NSString *) compareCurrentTime:(NSTimeInterval) compareDate;

/** 通过时间戳得出显示时间 */
+ (NSString *) getDateStringWithTimestamp:(NSTimeInterval)timestamp;

/** 通过时间戳和格式显示时间 */
+ (NSString *) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;

@end
