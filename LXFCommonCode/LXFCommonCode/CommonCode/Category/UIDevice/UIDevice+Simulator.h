//
//  UIDevice+Simulator.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/10/17.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIDevice (Simulator)

#pragma mark 是否为模拟器
@property (nonatomic, readonly) BOOL isSimulator;

@end
