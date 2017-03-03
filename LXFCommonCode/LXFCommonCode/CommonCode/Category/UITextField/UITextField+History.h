//
//  UITextField+History.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/3.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2
//
//  https://github.com/Jameson-zxm/UITextField-History
//   A category of UITextfiled that can record it's input as history

#import <UIKit/UIKit.h>

@interface UITextField (History)

/**
 *  identity of this textfield
 */
@property (retain, nonatomic) NSString* identify;

/**
 *  load textfiled input history
 *
 *  @param identify identity of this textfield
 *
 *  @return the history of it's input
 */
- (NSArray*) loadHistroy;

/**
 *  save current input text
 */
- (void) synchronize;

- (void) showHistory;
- (void) hideHistroy;

- (void) clearHistory;

@end
