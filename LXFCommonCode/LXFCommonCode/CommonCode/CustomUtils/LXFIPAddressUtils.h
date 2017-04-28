//
//  LXFIPAddressUtils.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/4/5.
//  Copyright © 2017年 LXF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXFIPAddressUtils : NSObject

//获取Ip
- (NSString *)getIPAddress:(BOOL)preferIPv4;

@end
