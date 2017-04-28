//
//  UIView+Xib.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/24.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIView+Xib.h"

@implementation UIView (Xib)

+ (instancetype)viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
