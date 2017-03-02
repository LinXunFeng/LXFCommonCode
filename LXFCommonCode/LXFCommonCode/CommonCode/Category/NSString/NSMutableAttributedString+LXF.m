//
//  NSMutableAttributedString+LXF.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "NSMutableAttributedString+LXF.h"
#import "UIColor+LXF.h"

@implementation NSMutableAttributedString (LXF)

+ (NSAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString suffixString:(NSString *)suffixString {
    
    return [self attributeStringWithPrefixString:prefixString
                                      prefixFont:0
                                     prefixColor:0
                                    suffixString:suffixString
                                      suffixFont:0
                                     suffixColor:0];
}

+ (NSAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString
                                             prefixFont:(CGFloat)prefixFont
                                            prefixColor:(UInt32)prefixColor
                                           suffixString:(NSString *)suffixString
                                             suffixFont:(CGFloat)suffixFont
                                            suffixColor:(UInt32)suffixColor{
    NSInteger prefixLength = prefixString.length;
    NSInteger suffixLength = suffixString.length;
    
    NSString *finalString = [NSString stringWithFormat:@"%@%@", prefixString, suffixString];
    
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:finalString];
    
    if (prefixFont==0 && prefixColor==0) {
        [attributedString addAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithHex:0x999999],
                                          NSFontAttributeName: [UIFont systemFontOfSize:10.0f]
                                          }
                                  range:NSMakeRange(0, prefixLength)];
        
        
    }else {
        [attributedString addAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithHex:prefixColor],
                                          NSFontAttributeName: [UIFont systemFontOfSize:prefixFont]
                                          }
                                  range:NSMakeRange(0, prefixLength)];
    }
    
    if (suffixFont==0 && suffixColor==0) {
        [attributedString addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10.0f],
                                          NSForegroundColorAttributeName: [UIColor colorWithHex:0xff786e]}
                                  range:NSMakeRange(prefixLength, suffixLength)];
    }else {
        
        
        [attributedString addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:suffixFont],
                                          NSForegroundColorAttributeName: [UIColor colorWithHex:suffixColor]}
                                  range:NSMakeRange(prefixLength, suffixLength)];
    }
    
    
    return attributedString;
}

+ (NSMutableAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString
                                              subffixImageName:(NSString *)subffixImageName
{
    
    NSString *string = prefixString;
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    UIImage *image = [UIImage imageNamed:subffixImageName];
    NSTextAttachment *backAttachment = [[NSTextAttachment alloc] init];
    backAttachment.image = image;
    backAttachment.bounds = CGRectMake(0, -2, image.size.width, image.size.height);
    NSAttributedString *backString = [NSAttributedString attributedStringWithAttachment:backAttachment];
    
    [mutableAttributedString appendAttributedString:backString];
    
    return mutableAttributedString;
    
}

+ (NSMutableAttributedString *)attributeStringWithSubffixString:(NSString *)subffixString
                                                prefixImageName:(NSString *)prefixImageName
{
    
    // NSString *string = subffixString;
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    UIImage *image = [UIImage imageNamed:prefixImageName];
    NSTextAttachment *backAttachment = [[NSTextAttachment alloc] init];
    backAttachment.image = image;
    backAttachment.bounds = CGRectMake(0, -2, image.size.width, image.size.height);
    NSAttributedString *backString = [NSAttributedString attributedStringWithAttachment:backAttachment];
    
    [mutableAttributedString appendAttributedString:backString];
    
    
    [mutableAttributedString appendAttributedString:[[NSMutableAttributedString alloc] initWithString:subffixString]];
    
    return mutableAttributedString;
    
}

@end
