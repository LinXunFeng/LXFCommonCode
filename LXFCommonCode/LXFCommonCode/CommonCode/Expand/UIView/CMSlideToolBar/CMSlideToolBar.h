//
//  CMSlideToolBar.h
//  WisdomSiteCloud
//
//  Created by jxj-wcm on 2017/2/22.
//  Copyright © 2017年 xjq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CMSlideToolBar;
@protocol CMSlideToolBarDelegate <NSObject>

-(void)slideToolBar:(CMSlideToolBar *)toolBar didSelectIndex:(NSInteger)buttonIndex;
@end

@interface CMSlideToolBar : UIView
/**
 *  二级菜单
 *
 *  @param items       所有的栏目 数组内必须是string
 *  @param frame       大小 高度建议40
 *  @param averageSize  是否平均分配 no 向左靠齐   yes
 *
 *  @return  IndicatorToolBar
 */
+(instancetype)creatToolBarWithItems:(NSArray<NSString *> *)items frame:(CGRect)frame avergae:(BOOL)averageSize btnFont:(UIFont *)btnFont delegate:(id<CMSlideToolBarDelegate>) delegate;

/**指示器高度*/
@property (assign, nonatomic) CGFloat indicatorViewH;
/**指示器宽度*/
@property (assign, nonatomic) CGFloat indicatorViewW;

/**指示器距离底部的距离*/
@property (assign, nonatomic) CGFloat indicatorBottomMargin;
/**指示器颜色*/
@property (strong, nonatomic) UIColor *indicatorColor;
/**子btn的font*/
@property (strong, nonatomic) UIFont *btnFont;
/*子btn 的 字体颜色**/
@property (strong, nonatomic) UIColor *fontColor;

/**底部阴影高度 defaul 为0*/
@property (assign, nonatomic) CGFloat shadowH;

/**当前的下标*/
@property (assign, nonatomic)  NSInteger currentIndex;

/**选中时的btn字体颜色*/
@property (strong, nonatomic) UIColor *selectColor;

/**不选中时的btn字体颜色*/
@property (strong, nonatomic) UIColor *normalColor;

/**btn之间的间隙*/
@property (assign, nonatomic) CGFloat margin;

/**展示小红点*/
@property (strong, nonatomic) NSArray * redPoints;

@property (weak, nonatomic)id<CMSlideToolBarDelegate>delegate;

@end
