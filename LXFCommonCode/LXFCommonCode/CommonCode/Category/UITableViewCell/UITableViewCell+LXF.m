//
//  UITableViewCell+LXF.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/27.
//  Copyright © 2017年 LXF. All rights reserved.
//

#import "UITableViewCell+LXF.h"
#import "UIView+Xib.h"

@implementation UITableViewCell (LXF)

+ (instancetype)loadCellFromClass:(UITableView *)tableView{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

+ (instancetype)loadCellFromNib:(UITableView *)tableView{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    
    if (!cell) {
        cell = [self viewFromXib];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
