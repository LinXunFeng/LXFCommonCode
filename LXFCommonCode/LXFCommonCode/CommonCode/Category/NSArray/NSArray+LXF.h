//
//  NSArray+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

/**
 *  防止nil而发生闪退的情况
 */
@interface NSArray (LXF)

//以下写法均防止闪退
+ (instancetype)safeArrayWithObject:(id)object;

- (id)safeObjectAtIndex:(NSUInteger)index;

- (NSArray *)safeSubarrayWithRange:(NSRange)range;

- (NSUInteger)safeIndexOfObject:(id)anObject;

//通过Plist名取到Plist文件中的数组
+ (NSArray *)arrayNamed:(NSString *)name;

// 数组转成json 字符串
- (NSString *)toJSONStringForArray;

/**
 *  返回数组的倒序数组
 */
- (NSArray *)reversedArray;



@end
