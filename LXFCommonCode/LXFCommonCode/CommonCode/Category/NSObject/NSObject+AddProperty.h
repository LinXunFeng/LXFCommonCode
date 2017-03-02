//
//  NSObject+AddProperty.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

@interface NSObject (AddProperty)

/**
 *  @brief  catgory runtime实现get set方法增加一个字符串属性
 */
@property (nonatomic,strong) NSString *stringProperty;
/**
 *  @brief  catgory runtime实现get set方法增加一个NSInteger属性
 */
@property (nonatomic,assign) NSInteger integerProperty;

@end
