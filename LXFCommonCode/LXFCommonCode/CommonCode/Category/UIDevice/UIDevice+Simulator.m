//
//  UIDevice+Simulator.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIDevice+Simulator.h"

@implementation UIDevice (Simulator)

- (BOOL)isSimulator
{
    static BOOL simu;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        simu = NSNotFound != [[self model] rangeOfString:@"Simulator"].location;
    });
    return simu;
}

@end
