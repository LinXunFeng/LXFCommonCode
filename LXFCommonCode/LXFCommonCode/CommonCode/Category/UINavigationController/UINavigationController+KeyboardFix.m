//
//  UINavigationController+KeyboardFix.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/3.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UINavigationController+KeyboardFix.h"

@implementation UINavigationController (KeyboardFix)

// This fixes an issue with the keyboard not dismissing on the iPad's login screen.
// http://stackoverflow.com/questions/3372333/ipad-keyboard-will-not-dismiss-if-modal-view-controller-presentation-style-is-ui/3386768#3386768
// http://developer.apple.com/library/ios/#documentation/uikit/reference/UIViewController_Class/Reference/Reference.html

- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}

@end
