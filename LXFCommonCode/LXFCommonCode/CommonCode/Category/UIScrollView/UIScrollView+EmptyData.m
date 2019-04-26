//
//  UIScrollView+EmptyData.m
//  LXFCommonCode
//
//  Created by LinXunFeng on 2019/4/26.
//  Copyright © 2019 LXF. All rights reserved.
//

#import "UIScrollView+EmptyData.h"
#import <objc/runtime.h>

#pragma mark - UIScrollView+EmptyData

@implementation UIScrollView (EmptyData)

- (void)updateEmptyDataWithConfig:(EmptyDataSetConfigure *)config {
    self.emptyDataSetConfig = config;
    if (!self.emptyDataSetDelegate) {
        self.emptyDataSetDelegate = self;
    }
    if (!self.emptyDataSetSource) {
        self.emptyDataSetSource = self;
    }
    [self reloadEmptyDataSet];
}

- (void)updateEmptyDataWithConfigBlock:(EmptyDataSetConfigure *(^)())configBlock {
    EmptyDataSetConfigure *config = configBlock();
    [self updateEmptyDataWithConfig:config];
}

#pragma mark DZNEmptyDataSetDelegate, DZNEmptyDataSetSource
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return scrollView.emptyDataSetConfig.tipImage;
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    EmptyDataSetConfigure *curConfig = scrollView.emptyDataSetConfig;
    
    NSString *tipStr = curConfig.tipStr ?: @"";
    UIFont *tipFont = curConfig.tipFont ?: [UIFont systemFontOfSize:14];
    UIColor *tipColor = curConfig.tipColor ?: [UIColor blackColor];
    
    return [[NSAttributedString alloc] initWithString:tipStr
                                           attributes:@{
                                                        NSFontAttributeName: tipFont,
                                                        NSForegroundColorAttributeName: tipColor
                                                        }];
}
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return scrollView.emptyDataSetConfig.verticalOffset;
}
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return scrollView.emptyDataSetConfig.allowScroll;
}
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return scrollView.emptyDataSetConfig.spaceHeight;
}
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    return scrollView.emptyDataSetConfig.buttonTitle;
}
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    if (!scrollView.emptyDataSetConfig.buttonImageBlock) {
        return nil;
    }
    return scrollView.emptyDataSetConfig.buttonImageBlock(state);
}
- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    if (!scrollView.emptyDataSetConfig.buttonBackgroundImageBlock) {
        return nil;
    }
    return scrollView.emptyDataSetConfig.buttonBackgroundImageBlock(state);
}
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    return scrollView.emptyDataSetConfig.customEmptyView;
}
- (UIColor *)imageTintColorForEmptyDataSet:(UIScrollView *)scrollView {
    return scrollView.emptyDataSetConfig.imageTintColor;
}
- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView {
    return scrollView.emptyDataSetConfig.imageAnimation;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view {
    if (scrollView.emptyViewTapBlock) {
        scrollView.emptyViewTapBlock(view);
    }
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    if (scrollView.emptyButtonTapBlock) {
        scrollView.emptyButtonTapBlock(button);
    }
}
- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView {
    // 修复 emptyDataSetView 偏移问题(如:与MJRefresh结合使用时y会出现-54)
    UIView *view = [scrollView valueForKey:@"emptyDataSetView"];
    CGRect frame = view.frame;
    frame.origin = CGPointZero;
    view.frame = frame;
    
    if (scrollView.emptyDataSetWillAppearBlock) {
        scrollView.emptyDataSetWillAppearBlock();
    }
}
- (void)emptyDataSetDidAppear:(UIScrollView *)scrollView {
    if (scrollView.emptyDataSetDidAppearBlock) {
        scrollView.emptyDataSetDidAppearBlock();
    }
}
- (void)emptyDataSetWillDisappear:(UIScrollView *)scrollView {
    if (scrollView.emptyDataSetWillDisappearBlock) {
        scrollView.emptyDataSetWillDisappearBlock();
    }
}
- (void)emptyDataSetDidDisappear:(UIScrollView *)scrollView {
    if (scrollView.emptyDataSetDidDisappearBlock) {
        scrollView.emptyDataSetDidDisappearBlock();
    }
}

#pragma mark 关联属性
static NSString *lxf_emptyDataSetConfigureKey = @"lxf_emptyDataSetConfigureKey";
static NSString *lxf_emptyViewTapBlockKey = @"lxf_emptyViewTapBlockKey";
static NSString *lxf_emptyButtonTapBlockKey = @"lxf_emptyButtonTapBlockKey";
static NSString *lxf_emptyDataSetWillAppearKey = @"lxf_emptyDataSetWillAppearKey";
static NSString *lxf_emptyDataSetDidAppearKey = @"lxf_emptyDataSetDidAppearKey";
static NSString *lxf_emptyDataSetWillDisappearKey = @"lxf_emptyDataSetWillDisappearKey";
static NSString *lxf_emptyDataSetDidDisappearKey = @"lxf_emptyDataSetDidDisappearKey";

- (EmptyDataSetConfigure *)emptyDataSetConfig {
    return objc_getAssociatedObject(self, &lxf_emptyDataSetConfigureKey);
}
- (void)setEmptyDataSetConfig:(EmptyDataSetConfigure * _Nonnull)emptyDataSetConfig {
    objc_setAssociatedObject(self, &lxf_emptyDataSetConfigureKey, emptyDataSetConfig, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UIView * _Nonnull))emptyViewTapBlock {
    return objc_getAssociatedObject(self, &lxf_emptyViewTapBlockKey);
}
- (void)setEmptyViewTapBlock:(void (^)(UIView * _Nonnull))emptyViewTapBlock {
    objc_setAssociatedObject(self, &lxf_emptyViewTapBlockKey, emptyViewTapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIButton * _Nonnull))emptyButtonTapBlock {
    return objc_getAssociatedObject(self, &lxf_emptyButtonTapBlockKey);
}
- (void)setEmptyButtonTapBlock:(void (^)(UIButton * _Nonnull))emptyButtonTapBlock {
    objc_setAssociatedObject(self, &lxf_emptyButtonTapBlockKey, emptyButtonTapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())emptyDataSetWillAppearBlock {
    return objc_getAssociatedObject(self, &lxf_emptyDataSetWillAppearKey);
}
- (void)setEmptyDataSetWillAppearBlock:(void (^)())emptyDataSetWillAppearBlock {
    objc_setAssociatedObject(self, &lxf_emptyDataSetWillAppearKey, emptyDataSetWillAppearBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())emptyDataSetDidAppearBlock {
    return objc_getAssociatedObject(self, &lxf_emptyDataSetDidAppearKey);
}
- (void)setEmptyDataSetDidAppearBlock:(void (^)())emptyDataSetDidAppearBlock {
    objc_setAssociatedObject(self, &lxf_emptyDataSetDidAppearKey, emptyDataSetDidAppearBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())emptyDataSetWillDisappearBlock {
    return objc_getAssociatedObject(self, &lxf_emptyDataSetDidAppearKey);
}
- (void)setEmptyDataSetWillDisappearBlock:(void (^)())emptyDataSetWillDisappearBlock {
    objc_setAssociatedObject(self, &lxf_emptyDataSetWillDisappearKey, emptyDataSetWillDisappearBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())emptyDataSetDidDisappearBlock {
    return objc_getAssociatedObject(self, &lxf_emptyDataSetDidDisappearKey);
}
- (void)setEmptyDataSetDidDisappearBlock:(void (^)())emptyDataSetDidDisappearBlock {
    objc_setAssociatedObject(self, &lxf_emptyDataSetDidDisappearKey, emptyDataSetDidDisappearBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

#pragma mark - EmptyDataSetConfigure

@implementation EmptyDataSetConfigure

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.verticalOffset = 0;
        self.tipStr = @"";
        self.tipFont = [UIFont systemFontOfSize:15];
        self.tipImage = nil;
        self.allowScroll = YES;
        self.spaceHeight = 11;
        self.buttonTitle = [[NSAttributedString alloc] init];
        self.buttonImageBlock = nil;
        self.buttonBackgroundImageBlock = nil;
        self.imageAnimation = nil;
        self.imageTintColor = nil;
        self.customEmptyView = nil;
        self.shouldFade = YES;
        self.shouldBeForcedToDisplay = NO;
        self.shouldDisplay = YES;
        self.shouldAllowTouch = YES;
        self.shouldAnimateImageView = NO;
    }
    return self;
}

+ (instancetype)defaultConfig {
    return [[EmptyDataSetConfigure alloc] init];
}

@end
