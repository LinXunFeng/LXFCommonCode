//
//  LXFObserver.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2


#import <Foundation/Foundation.h>

/**
 *  若被观察者先消失,注意提前移除通知即使观察者为nil
 */
typedef void (^DidChangeBlock)(id object, id value);

@interface LXFObserver : NSObject

/**
 *  被观察的对象
 */
@property(nonatomic, weak, readonly) id object;

/**
 *  被观察的属性
 */
@property(nonatomic, copy, readonly) NSString *objectKeyPath;

/**
 *  属性改变时调用
 */
@property(nonatomic, copy) DidChangeBlock didChange;


- (instancetype)init NS_UNAVAILABLE;

/**
 *  创建观察者
 *  didChange在值改变时调用
 */
+ (instancetype)observeObject:(id)object
                      keyPath:(NSString *)keyPath
                       change:(DidChangeBlock)didChange;

/**
 *  创建观察者
 *  didChange在观察者返回之前先调用一次
 */
+ (instancetype)observeOriginalObject:(id)object
                              keyPath:(NSString *)keyPath
                               change:(DidChangeBlock)didChange;

@end

