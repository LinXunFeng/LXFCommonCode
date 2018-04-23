//
//  UIImage+Format.m
//  LXFCommonCode
//
//  Created by LinXunFeng on 2018/4/23.
//  Copyright © 2018年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2
//  掘金: https://juejin.im/user/58f8065e61ff4b006646c72d

#import "UIImage+Format.h"

@implementation UIImage (Format)

- (NSData *)getData
{
    NSData *data = UIImageJPEGRepresentation(self, 1);
    if (!data) {
        data = UIImagePNGRepresentation(self);
    } else {// 进行压缩
        float i = 1;
        while (data.length > 200 * 1024 && i > 0.1) {
            i -= 0.1;
            data = UIImageJPEGRepresentation(self, i);
        }
    }
    return data;
}

- (NSString *)getFormatWithData:(NSData *)data
{
    uint8_t c;
    [data getBytes:&c length:1];
    
    NSString *format = nil;
    switch (c) {
        case 0xFF:
            format = @"jpg";
            break;
        case 0x89:
            format = @"png";
            break;
        case 0x47:
            format = @"gif";
            break;
        case 0x49:
        case 0x4D:
            format = @"tiff";
            break;
        default:
            break;
    }
    return format;
}

@end
