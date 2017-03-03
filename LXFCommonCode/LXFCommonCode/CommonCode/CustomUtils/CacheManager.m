//
//  CacheManager.m
//  Darling
//
//  Created by 罗天阳 on 16/4/20.
//  Copyright © 2016年 罗天阳. All rights reserved.
//

#import "CacheManager.h"
#import "LXFLog.h"

@implementation CacheManager
static CacheManager * manager = nil;

+ (instancetype)sharedCacheManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (NSString *)filePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [NSString stringWithFormat:@"%@/DarlingCache",paths[0]];
    return cachePath;
}

- (BOOL)saveCacheWithPageName:(NSString *)page obj:(id)object{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = [fileManager fileExistsAtPath:[self filePath] isDirectory:&isDir];
    if (isDir) {
        LXFLog(@"目录已存在");
    }else{
        BOOL succeed = [fileManager createDirectoryAtPath:[self filePath] withIntermediateDirectories:NO attributes:nil error:nil];
        LXFLog(@"创建目录 %@ %i",[self filePath],succeed);
    }
    
    NSString *filePath = [[self filePath] stringByAppendingPathComponent:page];
//    BOOL isCreate = [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:NO attributes:nil error:nil];
//    LXFLog(@"创建目录 %@ %i",filePath,isCreate);
    
    BOOL isSucceed = [NSKeyedArchiver archiveRootObject:object toFile:filePath];
    LXFLog(@"保存 %@ %i",page,isSucceed);
    
    return isSucceed;
}

- (id)getCacheDataWithPageName:(NSString *)page{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [[self filePath] stringByAppendingPathComponent:page];
    LXFLog(@" 获取 %@ 的路径 %@",page,filePath);
    
    id result;
    if ([fileManager fileExistsAtPath:filePath]) {
        result = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }else{
        result = nil;
        LXFLog(@"%@ 不存在",page);
    }
    return result;
}

- (BOOL)deleteWithPageName:(NSString *)page{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [[self filePath] stringByAppendingPathComponent:page];
    
    BOOL isSucceed = NO;
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (isExist) {
        isSucceed = [fileManager removeItemAtPath:filePath error:nil];
    }else{
        LXFLog(@"删除失败,%@不存在",page);
    }
    LXFLog(@"删除 %@,%i",page,isSucceed);
    return isSucceed;
}

- (BOOL)deleteAllPageCache{
    NSString *path = [self filePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isSucceed = [fileManager removeItemAtPath:path error:nil];
    LXFLog(@"删除所有页面缓存 %i",isSucceed);
    return isSucceed;
}

@end
