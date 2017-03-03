//
//  UITableViewCell+NIB.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/3.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UITableViewCell+NIB.h"

@implementation UITableViewCell (NIB)
/**
 *  @brief  加载同类名的nib
 *
 *  @return nib
 */
+(UINib*)nib{
   return  [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}
@end
