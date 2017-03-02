//
//  UserDefaultsUtils.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2


#import <Foundation/Foundation.h>

@interface UserDefaultsUtils : NSObject

+(void)saveCustomerObject:(id)obj forKey:(NSString *)key;

+(id)customerObjectWithKey:(NSString *)key;

+(void)saveValue:(id) value forKey:(NSString *)key;

+(id)valueWithKey:(NSString *)key;

+(BOOL)boolValueWithKey:(NSString *)key;

+(void)saveBoolValue:(BOOL)value withKey:(NSString *)key;

+(void)print;

+(void)deleteValueWithKey:(NSString *)key;

+(void)saveServiceKeyValue:(NSString *)value key:(NSString *)key;

+ (NSString *)getServiceKeyWithKey:(NSString *)key;

@end
