//
//  NSData+Hash.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "NSData+Hash.h"
#include <CommonCrypto/CommonCrypto.h>

@implementation NSData (Hash)

/**
 *  @brief  md5 NSData
 */
- (NSData *)md5Data
{
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}
/**
 *  @brief  sha1Data NSData
 */
- (NSData *)sha1Data
{
    unsigned char bytes[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_SHA1_DIGEST_LENGTH];
}
/**
 *  @brief  sha256Data NSData
 */
- (NSData *)sha256Data
{
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}
/**
 *  @brief  sha512Data NSData
 */
- (NSData *)sha512Data
{
    unsigned char bytes[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_SHA512_DIGEST_LENGTH];
}
/**
 *  @brief  md5 NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)hmacMD5DataWithKey:(NSData *)key {
    return [self hmacDataUsingAlg:kCCHmacAlgMD5 withKey:key];
}
/**
 *  @brief  sha1Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)hmacSHA1DataWithKey:(NSData *)key
{
    return [self hmacDataUsingAlg:kCCHmacAlgSHA1 withKey:key];
}
/**
 *  @brief  sha256Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)hmacSHA256DataWithKey:(NSData *)key
{
    return [self hmacDataUsingAlg:kCCHmacAlgSHA256 withKey:key];
}
/**
 *  @brief  sha512Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)hmacSHA512DataWithKey:(NSData *)key
{
    return [self hmacDataUsingAlg:kCCHmacAlgSHA512 withKey:key];
}


- (NSData *)hmacDataUsingAlg:(CCHmacAlgorithm)alg withKey:(NSData *)key {
    
    size_t size;
    switch (alg) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    unsigned char result[size];
    CCHmac(alg, [key bytes], key.length, self.bytes, self.length, result);
    return [NSData dataWithBytes:result length:size];
}

@end
