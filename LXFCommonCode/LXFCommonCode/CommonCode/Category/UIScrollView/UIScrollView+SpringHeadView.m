//
//  UIScrollView+SpringHeadView.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIScrollView+SpringHeadView.h"
#import <objc/runtime.h>

static char UIScrollViewSpringHeadView;

@implementation UIScrollView (SpringHeadView)

- (void)setTopView:(UIView *)topView{
    [self willChangeValueForKey:@"SpringHeadView"];
    objc_setAssociatedObject(self, &UIScrollViewSpringHeadView,
                             topView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"SpringHeadView"];
}

- (UIView *)topView{
    return objc_getAssociatedObject(self, &UIScrollViewSpringHeadView);
}


- (void)addSpringHeadView:(UIView *)view{
    self.contentInset = UIEdgeInsetsMake(view.bounds.size.height, 0, 0, 0);
    [self insertSubview:view atIndex:0];
    view.frame = CGRectMake(0, -view.bounds.size.height, view.bounds.size.width, view.bounds.size.height);
    self.topView = view;
    //使用kvo监听scrollView的滚动
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self scrollViewDidScroll:self];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offy = scrollView.contentOffset.y;
    
    if (offy < 0) {
        self.topView.frame = CGRectMake(0, offy, self.topView.bounds.size.width, -offy);
    }
}


@end
