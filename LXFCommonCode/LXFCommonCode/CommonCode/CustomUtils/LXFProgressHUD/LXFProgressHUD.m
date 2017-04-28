//
//  LXFProgressHUD.m
//  SVProgressHUD封装
//
//  Created by 林洵锋 on 2017/3/29.
//  Copyright © 2017年 林洵锋. All rights reserved.
//

#import "LXFProgressHUD.h"
#import "SVProgressHUD.h"

typedef enum {
    HUDTypeSuccess,
    HUDTypeError,
    HUDTypeLoding,
    HUDTypeInfo,
    HUDTypeProgress
} HUDType;

@implementation LXFProgressHUD


+ (void)initialize {
    [super initialize];
    
//    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7]];
//    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
//    [SVProgressHUD setMinimumSize:CGSizeMake(100, 100)];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:14.0]];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
}

+ (void)showSuccessWithStatus:(NSString *)status {
    [self LXFProgressHUDShowWithType:HUDTypeSuccess Status:status Image:nil Progress:NSNotFound];
}

+ (void)showErrorWithStatus:(NSString *)status {
    [self LXFProgressHUDShowWithType:HUDTypeError Status:status Image:nil Progress:NSNotFound];
}

+ (void)showLoding {
    [self LXFProgressHUDShowWithType:HUDTypeLoding Status:nil Image:nil Progress:NSNotFound];
}

+ (void)showLodingWithStatus:(NSString *)status {
    [self LXFProgressHUDShowWithType:HUDTypeLoding Status:status Image:nil Progress:NSNotFound];
}

+ (void)showInfoWithStatus:(NSString *)status {
    [self LXFProgressHUDShowWithType:HUDTypeInfo Status:status Image:nil Progress:NSNotFound];
}

+ (void)showProgress:(CGFloat)progress Status:(NSString *)status {
    [self LXFProgressHUDShowWithType:HUDTypeProgress Status:status Image:nil Progress:progress];
}

+ (void)dismissHUD {
    [SVProgressHUD dismiss];
}


// 私有方法
+ (void)LXFProgressHUDShowWithType:(HUDType)type Status:(NSString *)status Image:(UIImage *)img Progress:(CGFloat)progress {
    switch (type) {
        case HUDTypeSuccess:
            [SVProgressHUD showSuccessWithStatus:status];
            break;
        case HUDTypeError:
            [SVProgressHUD showErrorWithStatus:status];
            break;
        case HUDTypeInfo:
            [SVProgressHUD showInfoWithStatus:status];
            break;
        case HUDTypeLoding:
            [SVProgressHUD showWithStatus:status];
            break;
        case HUDTypeProgress:
            [SVProgressHUD showProgress:progress status:status];
            break;
        default:
            break;
    }
}


@end
