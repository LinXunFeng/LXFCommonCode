//
//  UIMenuItem+LXF.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIMenuItem+LXF.h"
#import <objc/runtime.h>
static int UIMenuItem_key;

@implementation UIMenuItem (LXF)

- (instancetype)initWithTitle:(NSString *)title actionBlock:(void (^)(id sender))block{
    self = [self initWithTitle:title action:@selector(invoke:)];
    objc_setAssociatedObject(self, &UIMenuItem_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}

- (void)invoke:(id)sender {
    void(^block)() = objc_getAssociatedObject(self, &UIMenuItem_key);
    if(block){
        block();
    }
}

@end
