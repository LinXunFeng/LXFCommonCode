//
//  UIViewController+NavBarButton.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIViewController+NavBarButton.h"

@implementation UIViewController (NavBarButton)

#pragma mark - 导航栏设置
- (void)setReturnButtonWithImage:(UIImage *)returnImage {
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:returnImage style:UIBarButtonItemStylePlain target:self action:@selector(back)];
}

- (void)setTitleWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.textColor = color;
    titleLabel.font = font;
    [titleLabel sizeToFit];
    UIView *titleView = [[UIView alloc] initWithFrame:titleLabel.frame];
    titleView.backgroundColor = [UIColor clearColor];
    [titleView addSubview:titleLabel];
    
    self.navigationItem.titleView = titleView;
}

#pragma mark - 监听事件
/** 返回 */
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
