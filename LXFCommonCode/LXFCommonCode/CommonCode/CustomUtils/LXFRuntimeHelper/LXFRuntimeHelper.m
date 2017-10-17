//
//  LXFRuntimeHelper.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "LXFRuntimeHelper.h"
#import <objc/runtime.h>

@implementation LXFRuntimeHelper

+ (instancetype)shareInstance
{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSArray*)extractPropertyNamesFromOjbect:(NSObject*)object
{
    NSMutableArray* propertyNames = [NSMutableArray array];
    
    unsigned int outCount;
    objc_property_t* properties = class_copyPropertyList([object class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        [propertyNames addObject:[NSString stringWithUTF8String:property_getName(property)]];
    }
    
    free(properties);
    
    return [propertyNames copy];
}

- (NSArray*)extractValuesFromObject:(NSObject*)object forPropertiesWithClass:(NSString*)className
{
    NSArray* propertyNames = [self extractPropertyNamesFromOjbect:object];
    NSMutableArray* propertyValues = [NSMutableArray array];
    
    for (NSString* property in propertyNames) {
        id value = [object valueForKey:property];
        
        if ([value isKindOfClass:(NSClassFromString(className))]) {
            [propertyValues addObject:value];
        }
    }
    return [propertyValues copy];
}

- (NSArray*)extractValuesFromObject:(NSObject*)object forPropertiesWithProtocol:(NSString*)protocolName
{
    NSArray* propertyNames = [self extractPropertyNamesFromOjbect:object];
    NSMutableArray* propertyValues = [NSMutableArray array];
    
    for (NSString* property in propertyNames) {
        id value = [object valueForKey:property];
        
        if ([value conformsToProtocol:(NSProtocolFromString(protocolName))]) {
            [propertyValues addObject:value];
        }
    }
    return [propertyValues copy];
}

@end
