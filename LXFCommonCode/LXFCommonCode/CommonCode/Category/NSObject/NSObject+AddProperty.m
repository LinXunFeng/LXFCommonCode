//
//  NSObject+AddProperty.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "NSObject+AddProperty.h"
#import <objc/runtime.h>

//objc_getAssociatedObject和objc_setAssociatedObject都需要指定一个固定的地址，这个固定的地址值用来表示属性的key，起到一个常量的作用。
static const void *StringProperty = &StringProperty;
static const void *IntegerProperty = &IntegerProperty;
//static char IntegerProperty;
@implementation NSObject (AddProperty)

@dynamic stringProperty;
//set
/**
 *  @brief  catgory runtime实现get set方法增加一个字符串属性
 */
-(void)setStringProperty:(NSString *)stringProperty{
    //use that a static const as the key
    objc_setAssociatedObject(self, StringProperty, stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //use that property's selector as the key:
    //objc_setAssociatedObject(self, @selector(stringProperty), stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//get
-(NSString *)stringProperty{
    return objc_getAssociatedObject(self, StringProperty);
}

//set
/**
 *  @brief  catgory runtime实现get set方法增加一个NSInteger属性
 */
-(void)setIntegerProperty:(NSInteger)integerProperty{
    NSNumber *number = [[NSNumber alloc]initWithInteger:integerProperty];
    objc_setAssociatedObject(self, IntegerProperty, number, OBJC_ASSOCIATION_ASSIGN);
}
//get
-(NSInteger)integerProperty{
    return [objc_getAssociatedObject(self, IntegerProperty) integerValue];
}

@end
