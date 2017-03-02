//
//  NSDictionary+LocaleLog.h
//  控制台打印字典
//
//  Created by LXF on 17/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "NSDictionary+LocaleLog.h"

@implementation NSDictionary (LocaleLog)

/*
 Xcode 没有针对国际化语言做特殊处理，直接 Log 字典，只打印 UTF8 的编码，不能显示中文。重写这个方法，就能够解决输出问题，这个方法是专门为了本地话提供的一个调试方法，只要重写，不需要导入头文件，程序中所有的 NSLog 字典的方法，都会被替代。
 */

- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}"];
    
    return strM;
}

@end
