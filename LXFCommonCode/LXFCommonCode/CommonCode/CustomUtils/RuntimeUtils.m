//
//  RuntimeUtils.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "RuntimeUtils.h"
#import <objc/runtime.h>
#import "LXFLog.h"

@implementation RuntimeUtils

/** 获取所有的成员变量 */
- (void)getAllVar:(NSObject *)obj {
    unsigned int count = 0;
    
    // 拷贝出所胡的成员变量列表
    Ivar *ivars = class_copyIvarList([obj class], &count);
    
    for (int i = 0; i<count; i++) {
        // 取出成员变量
        Ivar ivar = *(ivars + i);
        
        // 打印成员变量名字
        LXFLog(@"%s", ivar_getName(ivar));
        
        // 打印成员变量的数据类型
        LXFLog(@"%s", ivar_getTypeEncoding(ivar));
    }
    
    // 释放
    free(ivars);
}

/** 获取所有的成员方法 */
- (void)getAllMethods:(NSObject *)obj {
    unsigned int methCount = 0;
    
    Method *meths = class_copyMethodList([obj class], &methCount);
    
    for(int i = 0; i < methCount; i++) {
        
        Method meth = meths[i];
        
        SEL sel = method_getName(meth);
        
        const char *name = sel_getName(sel);
        
        NSLog(@"%s", name);
    }
    
    free(meths);
}

@end
