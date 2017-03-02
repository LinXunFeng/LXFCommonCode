//
//  NSString+URL.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "NSString+URL.h"
#import "NSObject+LXF.h"

@implementation NSString (URL)

#pragma mark - URL
- (NSString *)urlEncode
{
    if (self.length == 0) return @"";
    
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    /*
     NSString *encodedValue = (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(nil,
     (CFStringRef)string, nil,
     (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
     return encodedValue;
     */
}

- (NSString *)urlDecode
{
    if (self.length == 0) return @"";
    
    return self.stringByRemovingPercentEncoding;
}

- (NSString *)scheme
{
    NSRange range = [self rangeOfString:@"://"];
    if (range.length == 0) return @"";
    
    NSString *scheme = [self substringToIndex:range.location];
    return scheme;
}

- (NSString *)host
{
    NSString *scheme = self.scheme;
    if (!scheme.isNoEmpty) return @"";  //无schema该情况下无host
    
    NSString *noScheme = [self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@://",scheme] withString:@""];
    
    NSRange range = [noScheme rangeOfString:@"/"];
    if (range.length == 0) {    //无path
        NSRange queryRange = [noScheme rangeOfString:@"?"];
        //无查询字符串
        if(queryRange.length == 0) {
            return noScheme;
        }else {//有查询字符串
            return [noScheme substringToIndex:queryRange.location];
        }
    }else {
        return [noScheme substringToIndex:range.location];
    }
    
    return @"";
}

- (NSString *)keyValues
{
    NSString *scheme = self.scheme;
    if (!scheme.isNoEmpty) return @"";
    
    NSRange range = [self rangeOfString:@"?"];
    if (range.length == 0) return @"";
    
    return [self substringFromIndex:range.location+1];
}

- (NSDictionary *)queryDic
{
    NSString *keyValues = self.keyValues;
    if (!keyValues.isNoEmpty) return @{};
    
    return [self queryDicWithKeysValues:keyValues];
}

- (NSString *)path
{
    NSString *scheme = self.scheme;
    if (!scheme.isNoEmpty) return @"";
    
    NSString *path = nil;
    NSString *host = self.host;
    if (host.isNoEmpty) path = [self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@://%@",scheme,host] withString:@""];
    
    NSString *keyValue = self.keyValues;
    if (keyValue.isNoEmpty) path = [path stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"?%@",keyValue] withString:@""];
    
    return path;
}

- (NSString *)allPath
{
    NSString *scheme = self.scheme;
    if (!scheme.isNoEmpty) return @"";
    
    NSString *keyValue = self.keyValues;
    if (keyValue.isNoEmpty) return [self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"?%@",keyValue] withString:@""];
    
    return self;
}


#pragma mark - Private
//从k=v中获取键值
- (NSString *)valueFromKeyValue:(NSString *)keyValue atIndex:(NSUInteger)index
{
    return [[keyValue componentsSeparatedByString:@"="] objectAtIndex:index];
}

- (NSDictionary *)queryDicWithKeysValues:(NSString *)keysValues
{
    if (!keysValues.isNoEmpty) return @{};
    
    NSArray *pairArray = [keysValues componentsSeparatedByString:@"&"];  //键值对字符串
    NSMutableDictionary *queryDic= [NSMutableDictionary dictionaryWithCapacity:pairArray.count];
    NSString *key = nil;
    NSString *obj = nil;
    if (pairArray.count > 1)
    {
        for (NSString *pair in pairArray)
        {
            key = [self valueFromKeyValue:pair atIndex:0];
            obj = [self valueFromKeyValue:pair atIndex:1];
            [queryDic setObject:obj forKey:key];
        }
    }
    else if (pairArray.count == 1)
    {
        key = [self valueFromKeyValue:keysValues atIndex:0];
        obj = [self valueFromKeyValue:keysValues atIndex:1];
        [queryDic setObject:obj forKey:key];
    }
    
    return queryDic;
}

@end
