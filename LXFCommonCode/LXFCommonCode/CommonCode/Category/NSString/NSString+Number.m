//
//  NSString+Number.m
//  LXFCommonCode
//
//  Created by LinXunFeng on 2018/10/31.
//  Copyright © 2018 LXF. All rights reserved.
//

#import "NSString+Number.h"

@implementation NSString (Number)

/**
 *  @brief 清除小数点后多余的0
 *
 *  @return NSString
 */
-(NSString *)cleanNumber {
    NSString * s = nil;
    long offset = self.length - 1;
    while (offset)
    {
        s = [self substringWithRange:NSMakeRange(offset, 1)];
        if ([s isEqualToString:@"0"] || [s isEqualToString:@"."]) {
            offset--;
        } else {
            break;
        }
    }
    return [self substringToIndex:offset+1];
}

@end
