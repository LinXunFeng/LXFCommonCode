//
//  NSString+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

// 需要依赖 "NSData+LXF.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (LXF)

- (NSString *) trimHead;
- (NSString *) trimTail;
- (NSString *) trimBoth;
- (NSString *) MD5;
- (NSString *) AES;

- (BOOL) equals:(NSString*)str;
- (CGFloat) heightByFont:(UIFont*)font width:(CGFloat)width;
- (CGFloat) widthByFont:(UIFont*)font;

+ (NSString *)isEmpty:(NSString *)str;
-(NSString *) URLEncodingUTF8String;//编码
-(NSString *) URLDecodingUTF8String;//解码


/** 电话号码中间4位****显示 */
+ (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum;
/** 银行卡号中间8位显示 */
+ (NSString*) getSecrectStringWithAccountNo:(NSString*)accountNo;
/** Data类型转换为Base64 */
+ (NSString *)base64StringFromData:(NSData *)data length:(NSUInteger)length;

@end
