//
//  NSArray+LocaleLog.h
//  控制台打印数组
//
//  Created by LXF on 17/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "NSArray+LocaleLog.h"

@implementation NSArray (LocaleLog)

/*
 Xcode 没有针对国际化语言做特殊处理，直接 Log 数组，只打印 UTF8 的编码，不能显示中文。重写这个方法，就能够解决输出问题，这个方法是专门为了本地话提供的一个调试方法，只要重写，不需要导入头文件，程序中所有的 NSLog 数组的方法，都会被替代。
 */

- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [strM appendFormat:@"\t%@", obj];
        if (idx != self.count - 1) [strM appendFormat:@",\n"];
    }];
    
    [strM appendString:@"\n)"];
    
    return strM;
}

@end
