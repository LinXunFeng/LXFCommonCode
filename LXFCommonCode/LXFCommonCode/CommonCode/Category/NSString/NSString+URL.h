//
//  NSString+URL.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

@interface NSString (URL)

/************查询字符串************/
- (NSString *)urlEncode;
- (NSString *)urlDecode;
/**
 *  以https://github.com/GeniusBrother/HZExtend?author=GeniusBrother为例
 */
- (NSString *)scheme;   //https
- (NSString *)host; //github.com
- (NSString *)allPath;  //https://github.com/GeniusBrother/HZExtend
- (NSString *)path; ///GeniusBrother/HZExtend
- (NSString *)keyValues;    //author=GeniusBrother
- (NSDictionary *)queryDic; //@{@"author":@"GeniusBrother"}

@end
