//
//  RefreshUtil.h
//  Darling
//
//  Created by 罗天阳 on 16/2/23.
//  Copyright © 2016年 罗天阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RefreshUtil : NSObject

+ (instancetype)sharedRefreshUtil;

//下拉刷新后的更新数据方法
+ (NSMutableArray *)updateAfterHeadRefreshWithDownload:(NSArray *)downloadArray dataArray:(NSArray *)dataArray totalRow:(NSInteger)totalRow;

//上拉加载更多的更新数据方法
+ (NSMutableArray *)updateAfterFootRefreshWithDownload:(NSArray *)downloadArray dataArray:(NSArray *)dataArray pageSize:(NSInteger)pageSize;

@end
