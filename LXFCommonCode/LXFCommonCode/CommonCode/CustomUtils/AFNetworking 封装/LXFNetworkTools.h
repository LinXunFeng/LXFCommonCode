//
//  LXFNetworkTools.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@class LXFNetworkTools;

typedef enum{
    lxf_GET,
    lxf_POST
} lxf_RequestType;

@interface LXFNetworkTools : AFHTTPSessionManager

#pragma mark - 获取单例
+ (LXFNetworkTools *)shareInstance;

#pragma mark - 封装请求方法
- (void)requestWithMethodType: (lxf_RequestType)methodType urlSting:(NSString *)urlString parameters:(id)parameters finished:(void (^)(id result, NSError *error))finished;


@end
