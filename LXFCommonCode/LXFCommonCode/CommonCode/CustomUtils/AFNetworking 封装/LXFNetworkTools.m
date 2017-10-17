//
//  LXFNetworkTools.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "LXFNetworkTools.h"

static LXFNetworkTools *shareInstance = nil;

@implementation LXFNetworkTools

#pragma mark - 单例
+ (LXFNetworkTools *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (shareInstance == nil) {
            shareInstance = [[self alloc] init];
            
            shareInstance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                                       @"text/html",
                                                                       @"text/plain",
                                                                       @"image/jpeg",
                                                                       @"image/png",
                                                                       @"application/octet-stream",
                                                                       @"text/json",
                                                                       nil];
        }
    });
    
    return shareInstance;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (shareInstance == nil) {
            shareInstance = [super allocWithZone:zone];
        }
    });
    return shareInstance;
}

#pragma mark - 封装请求方法
- (void)requestWithMethodType: (lxf_RequestType)methodType urlSting:(NSString *)urlString parameters:(id)parameters finished:(void (^)(id result, NSError *error))finished{
    if (methodType == lxf_GET) {
        [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            finished(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            finished(nil, error);
        }];
    } else {
        [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            finished(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            finished(nil, error);
        }];
    }
}

- (void)cancel {
    // 取消网络请求
    [self.operationQueue cancelAllOperations];
    
    // 取消任务中的所有网络请求
//    [self.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 杀死Session
//    [self invalidateSessionCancelingTasks:YES];
}

@end
