//
//  NSRunLoop+PerformBlock.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/2.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

/* 使用
 - (void)testPerformBlockAndWait
 {
 // 1
 __block BOOL flag = NO;
 
 [[NSRunLoop currentRunLoop] performBlockAndWait:^(BOOL *finish) {
 double delayInSeconds = 2.0;
 dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
 dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 dispatch_after(popTime, queue, ^(void){
 // 2
 flag = YES;
 *finish = YES;
 });
 }];
 
 // 3
 XCTAssertTrue(flag);
 }
 */

#import <Foundation/Foundation.h>

extern NSString *const NSRunloopTimeoutException;

@interface NSRunLoop (PerformBlock)

/**
 *  @author ishkawa
 *
 *  @brief   extension of NSRunLoop for waiting.
 *
 *  @param block <#block description#>
 */
- (void)performBlockAndWait:(void (^)(BOOL *finish))block;
/**
 *  @author ishkawa
 *
 *  @brief   extension of NSRunLoop for waiting.
 *
 *  @param block <#block description#>
 */
- (void)performBlockAndWait:(void (^)(BOOL *finish))block timeoutInterval:(NSTimeInterval)timeoutInterval;

@end
