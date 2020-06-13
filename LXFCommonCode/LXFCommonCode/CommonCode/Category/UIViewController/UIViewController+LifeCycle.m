//
//  UIViewController+LifeCycle.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2020/6/13.
//  Copyright © 2020 LXF. All rights reserved.
//

#import "UIViewController+LifeCycle.h"
#import <objc/runtime.h>

@implementation UIViewController (LifeCycle)

static char lifeCycleKey;

- (UIViewControllerLifeCycle)lifeCycle {
    NSNumber *val = objc_getAssociatedObject(self, &lifeCycleKey);
    return (UIViewControllerLifeCycle)val.intValue;
}

- (void)setLifeCycle:(UIViewControllerLifeCycle)lifeCycle {
    objc_setAssociatedObject(self, &lifeCycleKey, @(lifeCycle), OBJC_ASSOCIATION_ASSIGN);
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selectors[] = {
            @selector(awakeFromNib),
            @selector(loadView),
            @selector(viewDidLoad),
            @selector(viewWillAppear:),
            @selector(viewWillLayoutSubviews),
            @selector(viewDidLayoutSubviews),
            @selector(viewDidAppear:),
            @selector(viewWillDisappear:),
            @selector(viewDidDisappear:),
            NSSelectorFromString(@"dealloc")
        };
        
        for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
            SEL originalSelector = selectors[index];
            SEL swizzledSelector = NSSelectorFromString([@"lxf_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
            Method originalMethod = class_getInstanceMethod(self, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

// xib 加载 完成
- (void)lxf_awakeFromNib {
    self.lifeCycle = UIViewControllerLifeCycleAwakeFromNib;
    [self lxf_awakeFromNib];
}

// 加载视图(默认从nib)
- (void)lxf_loadView {
    self.lifeCycle = UIViewControllerLifeCycleLoadView;
    [self lxf_loadView];
}

//视图控制器中的视图加载完成，viewController自带的view加载完成
- (void)lxf_viewDidLoad {
    self.lifeCycle = UIViewControllerLifeCycleViewDidLoad;
    [self lxf_viewDidLoad];
}

//视图将要出现
- (void)lxf_viewWillAppear:(BOOL)animated {
    self.lifeCycle = UIViewControllerLifeCycleViewWillAppear;
    [self lxf_viewWillAppear:animated];
}

// view 即将布局其 Subviews
- (void)lxf_viewWillLayoutSubviews {
    self.lifeCycle = UIViewControllerLifeCycleViewWillLayoutSubviews;
    [self lxf_viewWillLayoutSubviews];
}

// view 已经布局其 Subviews
- (void)lxf_viewDidLayoutSubviews {
    self.lifeCycle = UIViewControllerLifeCycleViewDidLayoutSubviews;
    [self lxf_viewDidLayoutSubviews];
}

//视图已经出现
- (void)lxf_viewDidAppear:(BOOL)animated {
    self.lifeCycle = UIViewControllerLifeCycleViewDidAppear;
    [self lxf_viewDidAppear:animated];
}

//视图将要消失
- (void)lxf_viewWillDisappear:(BOOL)animated {
    self.lifeCycle = UIViewControllerLifeCycleViewWillDisappear;
    [self lxf_viewWillDisappear:animated];
}

//视图已经消失
- (void)lxf_viewDidDisappear:(BOOL)animated {
    self.lifeCycle = UIViewControllerLifeCycleViewDidDisappear;
    [self lxf_viewDidDisappear:animated];
}

// 视图被销毁
- (void)lxf_dealloc {
    self.lifeCycle = UIViewControllerLifeCycleDealloc;
    [self lxf_dealloc];
}

@end
