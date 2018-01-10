//
//  UIImage+Compress.m
//  YouKa
//
//  Created by 林洵锋 on 2018/1/10
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "UIImage+Compress.h"

@implementation UIImage (Compress)

- (UIImage *)autoCompress {
    NSData *imgData = UIImageJPEGRepresentation(self, 1.0);
    
    if (imgData.length>1024*1024) {//1M以及以上
        imgData = UIImageJPEGRepresentation(self, 0.1);
    }else if (imgData.length>512*1024) {//0.5M-1M
        imgData = UIImageJPEGRepresentation(self, 0.5);
    }else if (imgData.length>200*1024) {//0.25M-0.5M
        imgData = UIImageJPEGRepresentation(self, 0.9);
    }
    
    return [UIImage imageWithData:imgData];
}

- (UIImage *)compressWithScale:(CGFloat)scale {
    NSData *imgData = UIImageJPEGRepresentation(self, scale);
    return [UIImage imageWithData:imgData];
}

@end
