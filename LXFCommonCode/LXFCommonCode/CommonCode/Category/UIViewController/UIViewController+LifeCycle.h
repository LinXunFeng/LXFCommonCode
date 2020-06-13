//
//  UIViewController+LifeCycle.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2020/6/13.
//  Copyright © 2020 LXF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    UIViewControllerLifeCycleUnknow,
    UIViewControllerLifeCycleAwakeFromNib,
    UIViewControllerLifeCycleLoadView,
    UIViewControllerLifeCycleViewDidLoad,
    UIViewControllerLifeCycleViewWillAppear,
    UIViewControllerLifeCycleViewWillLayoutSubviews,
    UIViewControllerLifeCycleViewDidLayoutSubviews,
    UIViewControllerLifeCycleViewDidAppear,
    UIViewControllerLifeCycleViewWillDisappear,
    UIViewControllerLifeCycleViewDidDisappear,
    UIViewControllerLifeCycleDealloc,
} UIViewControllerLifeCycle;

@interface UIViewController (LifeCycle)

/** 当前所处的生命周期状态 */
@property(nonatomic, assign) UIViewControllerLifeCycle lifeCycle;

@end

NS_ASSUME_NONNULL_END
