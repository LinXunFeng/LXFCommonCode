//
//  UITableViewCell+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/27.
//  Copyright © 2017年 LXF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (LXF)

+ (instancetype)loadCellFromClass:(UITableView *)tableView;
+ (instancetype)loadCellFromNib:(UITableView *)tableView;

@end
