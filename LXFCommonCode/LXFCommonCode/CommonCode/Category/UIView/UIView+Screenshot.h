//
//  UIView+Screenshot.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UIView (Screenshot)

/** View截图 */
- (UIImage*) screenshot;

/** ScrollView截图 contentOffset */
- (UIImage*) screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;

/** View按Rect截图 */
- (UIImage*) screenshotInFrame:(CGRect)frame;

@end
