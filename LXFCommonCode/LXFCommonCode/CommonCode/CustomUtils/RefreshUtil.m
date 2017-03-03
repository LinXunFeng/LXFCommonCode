//
//  RefreshUtil.m
//  Darling
//
//  Created by 罗天阳 on 16/2/23.
//  Copyright © 2016年 罗天阳. All rights reserved.
//

#import "RefreshUtil.h"

//宏定义,初始化单例对象
#define DISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

@implementation RefreshUtil

+ (instancetype)sharedRefreshUtil{
    static RefreshUtil *util = nil;
    DISPATCH_ONCE_BLOCK(^{
        util = [[super allocWithZone:NULL] init];
    })
    return util;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [RefreshUtil sharedRefreshUtil];
}

- (instancetype)copyWithZone:(struct _NSZone*)zone{
    return [RefreshUtil sharedRefreshUtil];
}

+ (NSMutableArray *)updateAfterHeadRefreshWithDownload:(NSArray *)downloadArray dataArray:(NSArray *)dataArray totalRow:(NSInteger)totalRow{
    NSMutableArray *array = [NSMutableArray array];
    if (totalRow <= dataArray.count) {
        array = [downloadArray mutableCopy];
    }else{
        if (dataArray.count <= downloadArray.count) {
            array = [downloadArray mutableCopy];
        }else{
            array = [dataArray mutableCopy];
            for (int i = 0; i < downloadArray.count; i++) {
                id obj = downloadArray[i];
                [array replaceObjectAtIndex:i withObject:obj];
            }
        }
    }
//    return array;
    return [downloadArray mutableCopy];
}

+ (NSMutableArray *)updateAfterFootRefreshWithDownload:(NSArray *)downloadArray dataArray:(NSArray *)dataArray pageSize:(NSInteger)pageSize{
    NSMutableArray *array = [dataArray mutableCopy];
    if (!dataArray.count) {
        array = [downloadArray mutableCopy];
    }else{
        /*if (dataArray.count%pageSize == 0) {
            for (id obj in downloadArray) {
                [array addObject:obj];
            }
        }else{
            NSInteger tmp = dataArray.count-(dataArray.count%pageSize);
            NSMutableArray *tmpArray = [NSMutableArray array];
            for (int i = 0; i < tmp; i++) {
                id obj = dataArray[i];
                [tmpArray addObject:obj];
            }
            [tmpArray addObjectsFromArray:downloadArray];
            array = tmpArray;
        }*/
        [array addObjectsFromArray:downloadArray];
    }
    
    return array;
}

@end
