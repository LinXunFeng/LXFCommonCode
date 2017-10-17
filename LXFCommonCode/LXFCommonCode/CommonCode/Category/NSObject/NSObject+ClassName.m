//
//  NSObject+ClassName.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "NSObject+ClassName.h"
#import <objc/runtime.h>

@implementation NSObject (ClassName)
#if (TARGET_OS_IPHONE)
- (NSString*)className
{
    return [NSString stringWithUTF8String:class_getName([self class])];
}
+ (NSString*)className
{
    return [NSString stringWithUTF8String:class_getName(self)];
}
#endif
@end
