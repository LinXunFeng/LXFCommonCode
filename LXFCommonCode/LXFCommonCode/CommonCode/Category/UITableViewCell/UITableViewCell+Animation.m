//
//  UITableViewCell+Animation.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UITableViewCell+Animation.h"

@implementation UITableViewCell (Animation)

-(void)extendAnimation
{
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:0.25 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}
-(void)shutterAnimation
{
    self.layer.transform = CATransform3DMakeScale(1, 0.1, 0.1);
    [UIView animateWithDuration:0.35 animations:^{
        
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

-(void)graduatedAnimation
{
    self.transform = CGAffineTransformMakeScale(0.8, 0.8);
    self.alpha = 0.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.alpha = 1.0;
    }];
}

@end
