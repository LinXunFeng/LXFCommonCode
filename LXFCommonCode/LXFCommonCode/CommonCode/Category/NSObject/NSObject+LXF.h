//
//  NSObject+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

@interface NSObject (LXF)

/**
 *  判断为非空,既非NSNull且长度(字符串)或者count(集合)>0
 */
- (BOOL)isNoEmpty;

@end
