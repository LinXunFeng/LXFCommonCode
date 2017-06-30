//
//  NSObject+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "NSObject+Keyboard.h"

@implementation NSObject (Keyboard)


// 全局隐藏键盘
- (void)hideKeyBoard {
    for (UIWindow* window in [UIApplication sharedApplication].windows) {
        for (UIView* view in window.subviews) {
            [self dismissAllKeyBoardInView:view];
        }
    }
}

-(BOOL) dismissAllKeyBoardInView:(UIView *)view {
    if([view isFirstResponder]) {
        [view resignFirstResponder];
        return YES;
    }
    for(UIView *subView in view.subviews) {
        if([self dismissAllKeyBoardInView:subView]) {
            return YES;
        }
    }
    return NO;
}

@end
