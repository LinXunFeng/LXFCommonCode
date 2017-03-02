//
//  NSDictionary+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

/**
 *  用于数据解析，返回对象为字符串或值类型，数组和字典不要用此方法
 */
@interface NSDictionary (LXF)

//用于数据解析，返回对象为字符串或值类型，数组和字典不要用此方法
- (id)safeObjectForKey:(NSString *)key;

//设置键值对 针对对象为空处理
- (void)safeSetObject:(id)object forKey:(id)key;
- (id)objectForKeyCustom:(id)aKey;

- (id)safeKeyForValue:(id)value;

/**
 *  字段转成json的字符串
 *
 *  @return json 字符串
 */
- (NSString *)toJSONStringForDictionary;

@end
