//
//  UserDefaultsUtils.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UserDefaultsUtils.h"
#import "LXFLog.h"

@implementation UserDefaultsUtils

+(void)saveCustomerObject:(id)obj forKey:(NSString *)key
{
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:obj];
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:data forKey:key];
    [userDefaults synchronize];
}

+(id)customerObjectWithKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSData * data = [userDefaults objectForKey:key];
    id obj = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return obj;
}
+(void)saveServiceKeyValue:(NSString *)value key:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    
}
+ (NSString *)getServiceKeyWithKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    return  [userDefaults objectForKey:key];
    
}
+(void)saveValue:(id) value forKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+(id)valueWithKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

+(BOOL)boolValueWithKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:key];
}

+(void)saveBoolValue:(BOOL)value withKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:value forKey:key];
    [userDefaults synchronize];
}

+(void)print{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary * dic = [userDefaults dictionaryRepresentation];
    LXFLog(@"%@",dic);
}

+(void)deleteValueWithKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

@end
