//
//  AnimationManager.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2018/4/23.
//  Copyright © 2018年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2
//  掘金: https://juejin.im/user/58f8065e61ff4b006646c72d

#import <UIKit/UIKit.h>

@interface AnimationManager : NSObject

+ (CABasicAnimation *)scaleAnimationFrom:(CGFloat)fromScale toScale:(CGFloat)toScale duration:(CGFloat)duration;
+ (CABasicAnimation *)opacityAnimationFrom:(CGFloat)fromOpacity toOpacity:(CGFloat)toOpacity duration:(CGFloat)duration;
+ (CABasicAnimation *)rotationAnimationFrom:(CGFloat)fromDegree toDegree:(CGFloat)toDegree duration:(CGFloat)duration repeadCount:(NSUInteger)count timingFunction:(NSString *)functionName;
+ (CAAnimation *)fakeDropInAnimationWithFromPosition:(CGPoint)fromPosition toPosition:(CGPoint)toPosition duration:(CFTimeInterval)duration;
+ (CABasicAnimation *)positionAnimationFromPosition:(CGPoint)fromPosition toPosition:(CGPoint)toPosition duration:(CFTimeInterval)duration;

+ (CAAnimation *)boundsAnimationFrom:(CGRect)fromRect to:(CGRect)toRect duration:(NSTimeInterval)duration delegate:(id)delegate;
+ (CAAnimation *)fadeAnimationFrom:(CGFloat)fromFloat to:(CGFloat)toFloat duration:(NSTimeInterval)duration delegate:(id)delegate;
+ (CAKeyframeAnimation *)positionKeyFrameAnimationWithKeyPath:(NSString *)keyPath keyTime:(NSArray *)keyTimes values:(NSArray *)values duration:(NSTimeInterval)duration delegate:(id)delegate;
+ (CAAnimation *)imageContentAnimationFrom:(UIImage *)fromImg to:(UIImage *)toImg duration:(NSTimeInterval)duration delegate:(id)delegate;
+ (CAAnimation *)popOutAnimation;
+ (CAAnimation *)popInAnimation;
+ (CAAnimation *)changeRootAnimation;
+ (CAAnimation *)presentFadeAnimation;

@end
