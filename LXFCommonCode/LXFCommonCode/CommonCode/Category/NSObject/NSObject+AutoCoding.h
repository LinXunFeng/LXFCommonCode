//
//  NSObject+AutoCoding.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

@interface NSObject (AutoCoding) <NSSecureCoding>

//coding
+ (NSDictionary *)codableProperties;
- (void)setWithCoder:(NSCoder *)aDecoder;
//property access
- (NSDictionary *)codableProperties;
- (NSDictionary *)dictionaryRepresentation;
//loading / saving
+ (instancetype)objectWithContentsOfFile:(NSString *)path;
- (BOOL)writeToFile:(NSString *)filePath atomically:(BOOL)useAuxiliaryFile;

@end
