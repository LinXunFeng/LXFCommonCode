//
//  LXFRuntimeHelper.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2
//  掘金: https://juejin.im/user/58f8065e61ff4b006646c72d

#import <Foundation/Foundation.h>

@interface LXFRuntimeHelper : NSObject

+ (instancetype)shareInstance;

/**
 *  提取对象的全部属性名
 */
- (NSArray*)extractPropertyNamesFromOjbect:(NSObject*)object;

/**
 *  提取对象的指定类名的全部属性值
 */
- (NSArray*)extractValuesFromObject:(NSObject*)object forPropertiesWithClass:(NSString*)className;

/**
 *  提取对象的指定协议的全部属性值
 */
- (NSArray*)extractValuesFromObject:(NSObject*)object forPropertiesWithProtocol:(NSString*)protocolName;

@end
