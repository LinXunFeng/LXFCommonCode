//
//  NSInvocation+Bb.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

@interface NSInvocation (Bb)

+ (id)doInstanceMethodTarget:(id)target
                   selectorName:(NSString *)selectorName
                           args:(NSArray *)args;

+ (id)doClassMethod:(NSString *)className
          selectorName:(NSString *)selectorName
                  args:(NSArray *)args;

- (void)setArgumentWithObject:(id)object atIndex:(NSUInteger)index;

@end
