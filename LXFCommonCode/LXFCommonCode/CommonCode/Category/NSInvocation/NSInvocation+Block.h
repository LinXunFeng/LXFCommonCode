//
//  NSInvocation+Block.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

@interface NSInvocation (Block)

+ (instancetype)invocationWithBlock:(id) block;
+ (instancetype)invocationWithBlockAndArguments:(id) block ,...;

@end
