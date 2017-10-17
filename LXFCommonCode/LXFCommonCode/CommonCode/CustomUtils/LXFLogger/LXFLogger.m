//
//  LXFLogger.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "LXFLogger.h"
#import "SystemInfo.h"

@implementation LXFLogger

+ (void)load
{
#ifdef DEBUG
    fprintf(stderr, "****************************************************************************************\n");
    fprintf(stderr, "                                                   \n");
    fprintf(stderr, "        copyright (c) 2016, {MichaelHuyp}               \n");
    fprintf(stderr, "        http://git.oschina.net/MichaelHuyp                         \n");
    fprintf(stderr, "                                                   \n");
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    
    fprintf(stderr, "        %s %s    \n", [SystemInfo platformString].UTF8String, [SystemInfo osVersion].UTF8String);
    //    fprintf( stderr, "        ip: %s    \n", [SystemInfo localIPAddress].UTF8String );
    fprintf(stderr, "        运营商: %s    \n", [SystemInfo getCarrierName].UTF8String);
    //    fprintf(stderr, "        手机唯一标识: %s    \n", [SystemInfo uuidSolution].UTF8String);
    fprintf(stderr, "        Home: %s    \n", [NSBundle mainBundle].bundlePath.UTF8String);
    fprintf(stderr, "                                                    \n");
    fprintf(stderr, "****************************************************************************************\n");
#endif
    
#endif
}

+ (instancetype)sharedInstance
{
    static LXFLogger* _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[LXFLogger alloc] init];
    });
    return _instance;
}

@end
