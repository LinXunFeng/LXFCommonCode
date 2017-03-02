//
//  NSData+LXF.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <Foundation/Foundation.h>

@interface NSData (LXF)
/*
 !	@function	+dataWithBase64EncodedString:
 @discussion	This method returns an autoreleased NSData object. The NSData object is initialized with the
 contents of the Base 64 encoded string. This is a convenience method.
 @param	inBase64String	An NSString object that contains only Base 64 encoded data.
 @result	The NSData object. 
 */
+ (NSData *) dataWithBase64EncodedString:(NSString *) string;

/*
 !	@function	-initWithBase64EncodedString:
 @discussion	The NSData object is initialized with the contents of the Base 64 encoded string.
 This method returns self as a convenience.
 @param	inBase64String	An NSString object that contains only Base 64 encoded data.
 @result	This method returns self. 
 */
- (id) initWithBase64EncodedString:(NSString *) string;

/*
 !	@function	-base64EncodingWithLineLength:
 @discussion	This method returns a Base 64 encoded string representation of the data object.
 @param	inLineLength A value of zero means no line breaks.  This is crunched to a multiple of 4 (the next
 one greater than inLineLength).
 @result	The base 64 encoded data. 
 */
- (NSString *) base64EncodingWithLineLength:(unsigned int) lineLength;

- (NSString *)base64Encoding;

- (NSString *) MD5;

- (NSData *) AES;


+ (NSData *)base64DataFromString:(NSString *)string;

@end
