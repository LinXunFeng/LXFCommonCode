//
//  UITableViewCell+TS_delaysContentTouches.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/3.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UITableViewCell+TS_delaysContentTouches.h"

@implementation UITableViewCell (TS_delaysContentTouches)

- (UIScrollView*) ts_scrollView
{
    id sv = self.contentView.superview;
    while ( ![sv isKindOfClass: [UIScrollView class]] && sv != self )
    {
        sv = [sv superview];
    }
    
    return sv == self ? nil : sv;
}

- (void) setTs_delaysContentTouches:(BOOL)delaysContentTouches
{
    [self willChangeValueForKey: @"ts_delaysContentTouches"];
    
    [[self ts_scrollView] setDelaysContentTouches: delaysContentTouches];
    
    [self didChangeValueForKey: @"ts_delaysContentTouches"];
}

- (BOOL) ts_delaysContentTouches
{
    return [[self ts_scrollView] delaysContentTouches];
}



@end
