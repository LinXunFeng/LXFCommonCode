//
//  NSSet+Block.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

@interface NSSet (Block)

- (void)each:(void (^)(id))block;
- (void)eachWithIndex:(void (^)(id, int))block;
- (NSArray *)map:(id (^)(id object))block;
- (NSArray *)select:(BOOL (^)(id object))block;
- (NSArray *)reject:(BOOL (^)(id object))block;
- (NSArray *)sort;
- (id)reduce:(id(^)(id accumulator, id object))block;
- (id)reduce:(id)initial withBlock:(id(^)(id accumulator, id object))block;

@end
