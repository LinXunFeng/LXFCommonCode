//
//  UIView+Nib.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (Nib)
+ (UINib *)loadNib;
+ (UINib *)loadNibNamed:(NSString*)nibName;
+ (UINib *)loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle;
+ (instancetype)loadInstanceFromNib;
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName;
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

@end
