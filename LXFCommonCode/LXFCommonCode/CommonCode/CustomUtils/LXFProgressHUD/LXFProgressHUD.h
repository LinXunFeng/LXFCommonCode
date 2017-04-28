//
//  LXFProgressHUD.h
//  SVProgressHUD封装
//
//  Created by 林洵锋 on 2017/3/29.
//  Copyright © 2017年 林洵锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXFProgressHUD : NSObject

+ (void)showSuccessWithStatus:(NSString *)status;
+ (void)showErrorWithStatus:(NSString *)status;
+ (void)showLoding;
+ (void)showLodingWithStatus:(NSString *)status;
+ (void)showInfoWithStatus:(NSString *)status;
+ (void)showProgress:(CGFloat)progress Status:(NSString *)status;

+ (void)dismissHUD;

@end
