//
//  UIView+Animation.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIView (Animation)

/** 动画回调方法 */
@property(nonatomic,copy)void(^completeBlock)();

/** 摇动动画 */
- (void) shakeAnimation;

/** 弹跳动画 */
- (void) springingAnimation;

/** 旋转180°动画 */
- (void) trans180DegreeAnimation;

/** 抛物线动画（起始、高度、时间、执行回调方法） */
- (void) throwFrom:(CGPoint)start to:(CGPoint)end height:(CGFloat)height
          duration:(CGFloat)duration completedBlock:(void(^)())completedBlock;

/** 点攒动画 */
- (void) praiseAnimation;


@end
