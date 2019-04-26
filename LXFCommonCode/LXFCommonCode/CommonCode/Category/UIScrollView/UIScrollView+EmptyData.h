//
//  UIScrollView+EmptyData.h
//  LXFCommonCode
//
//  Created by LinXunFeng on 2019/4/26.
//  Copyright © 2019 LXF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"

// 对 DZNEmptyDataSet 的封装

NS_ASSUME_NONNULL_BEGIN

@interface EmptyDataSetConfigure : NSObject

/// 纵向偏移(0)  CGFloat
@property(nonatomic, assign) CGFloat verticalOffset;
/// 提示语(暂无数据)  String
@property(nonatomic, copy) NSString *tipStr;
/// 提示语的font(system15)  UIFont
@property(nonatomic, strong) UIFont *tipFont;
/// 提示语颜色  UIColor
@property(nonatomic, strong) UIColor *tipColor;
/// 提示图 UIImage
@property(nonatomic, strong, nullable) UIImage *tipImage;
/// 允许滚动(true) Bool
@property(nonatomic, assign) BOOL allowScroll;
/// 各元素之间的间距(11)
@property(nonatomic, assign) CGFloat spaceHeight;
/// 按钮标题
@property(nonatomic, strong) NSAttributedString *buttonTitle;
/// 按钮图片
@property(nonatomic, copy, nullable) UIImage *(^buttonImageBlock)(UIControlState);
/// 按钮背景图片
@property(nonatomic, copy, nullable) UIImage *(^buttonBackgroundImageBlock)(UIControlState);
/// image动画
@property(nonatomic, strong, nullable) CAAnimation *imageAnimation;
/// imageTintColor
@property(nonatomic, strong, nullable) UIColor *imageTintColor;
/// customEmptyView
@property(nonatomic, strong, nullable) UIView *customEmptyView;
/// shouldFade(true)
@property(nonatomic, assign) BOOL shouldFade;
/// shouldBeForcedToDisplay(false)
@property(nonatomic, assign) BOOL shouldBeForcedToDisplay;
/// shouldDisplay(true)
@property(nonatomic, assign) BOOL shouldDisplay;
/// shouldAllowTouch(true)
@property(nonatomic, assign) BOOL shouldAllowTouch;
/// shouldAnimateImageView(false)
@property(nonatomic, assign) BOOL shouldAnimateImageView;

+ (instancetype)defaultConfig;

@end

@interface UIScrollView (EmptyData) <DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>

/** 配置 */
@property(nonatomic, strong, readonly) EmptyDataSetConfigure *emptyDataSetConfig;

@property(nonatomic, copy) void(^emptyViewTapBlock)(UIView *);
@property(nonatomic, copy) void(^emptyButtonTapBlock)(UIButton *);
@property(nonatomic, copy) void(^emptyDataSetWillAppearBlock)();
@property(nonatomic, copy) void(^emptyDataSetDidAppearBlock)();
@property(nonatomic, copy) void(^emptyDataSetWillDisappearBlock)();
@property(nonatomic, copy) void(^emptyDataSetDidDisappearBlock)();

- (void)updateEmptyDataWithConfig:(EmptyDataSetConfigure *)config;
- (void)updateEmptyDataWithConfigBlock:(EmptyDataSetConfigure *(^)())configBlock;

@end

NS_ASSUME_NONNULL_END
