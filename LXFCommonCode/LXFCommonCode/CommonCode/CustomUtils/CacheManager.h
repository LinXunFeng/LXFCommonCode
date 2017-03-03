//
//  CacheManager.h
//  Darling
//
//  Created by 罗天阳 on 16/4/20.
//  Copyright © 2016年 罗天阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

+ (instancetype)sharedCacheManager;

- (BOOL)saveCacheWithPageName:(NSString *)page obj:(id)object;

- (id)getCacheDataWithPageName:(NSString *)page;

- (BOOL)deleteWithPageName:(NSString *)page;

- (BOOL)deleteAllPageCache;

@end
