//
//  UIView+Frame.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/** origin */
@property (nonatomic, assign) CGPoint origin;
/** size */
@property(nonatomic, assign) CGSize  size;
/** 宽度 */
@property(nonatomic, assign) CGFloat width;
/** 高度 */
@property(nonatomic, assign) CGFloat height;
/** x */
@property(nonatomic, assign) CGFloat x;
/** y */
@property(nonatomic, assign) CGFloat y;
/** centerX */
@property(nonatomic, assign) CGFloat centerX;
/** centerY */
@property(nonatomic, assign) CGFloat centerY;

/** x上限 */
- (CGFloat)maxX;
/** y上限 */
- (CGFloat)maxY;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;
@property (readonly) CGPoint topLeft;

@end
