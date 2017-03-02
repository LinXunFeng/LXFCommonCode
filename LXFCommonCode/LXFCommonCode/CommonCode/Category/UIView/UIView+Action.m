//
//  UIView+Action.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIView+Action.h"
#import <objc/runtime.h>

static const char kBlock = '\0';
@implementation UIView (Action)

- (void)tapPeformBlock:(void(^)())block
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
    [self setBlock:block];
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    void(^voidBlock)() = [self block];
    if (voidBlock) {
        voidBlock();
    }
}

- (void)setBlock:(void(^)())block
{
    if (block) {
        objc_setAssociatedObject(self, &kBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void(^)())block
{
    return objc_getAssociatedObject(self, &kBlock);
}

@end
