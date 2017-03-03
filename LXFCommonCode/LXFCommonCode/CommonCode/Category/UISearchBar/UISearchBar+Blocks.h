//
//  UISearchBar+Blocks.h
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/3/3.
//  Copyright © 2017年 LXF. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import <UIKit/UIKit.h>

@interface UISearchBar (Blocks)

@property (copy, nonatomic) BOOL (^completionShouldBeginEditingBlock)(UISearchBar *searchbar);
@property (copy, nonatomic) void (^completionTextDidBeginEditingBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) BOOL (^completionShouldEndEditingBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^completionTextDidEndEditingBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^completionTextDidChangeBlock)(UISearchBar *searchBar, NSString *searchText);
@property (copy, nonatomic) BOOL (^completionShouldChangeTextInRangeBlock)(UISearchBar *searchBar, NSRange range, NSString *replacementText);
@property (copy, nonatomic) void (^completionSearchButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^completionBookmarkButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^completionCancelButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^completionResultsListButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^completionSelectedScopeButtonIndexDidChangeBlock)(UISearchBar *searchBar, NSInteger selectedScope);

- (void)setCompletionShouldBeginEditingBlock:(BOOL (^)(UISearchBar *searchBar))searchBarShouldBeginEditingBlock;
- (void)setCompletionTextDidBeginEditingBlock:(void (^)(UISearchBar *searchBar))searchBarTextDidBeginEditingBlock;
- (void)setCompletionShouldEndEditingBlock:(BOOL (^)(UISearchBar *searchBar))searchBarShouldEndEditingBlock;
- (void)setCompletionTextDidEndEditingBlock:(void (^)(UISearchBar *searchBar))searchBarTextDidEndEditingBlock;
- (void)setCompletionTextDidChangeBlock:(void (^)(UISearchBar *searchBar, NSString *text))searchBarTextDidChangeBlock;
- (void)setCompletionShouldChangeTextInRangeBlock:(BOOL (^)(UISearchBar *searchBar, NSRange range, NSString *text))searchBarShouldChangeTextInRangeBlock;
- (void)setCompletionSearchButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarSearchButtonClickedBlock;
- (void)setCompletionBookmarkButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarBookmarkButtonClickedBlock;
- (void)setCompletionCancelButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarCancelButtonClickedBlock;
- (void)setCompletionResultsListButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarResultsListButtonClickedBlock;
- (void)setCompletionSelectedScopeButtonIndexDidChangeBlock:(void (^)(UISearchBar *searchBar, NSInteger index))searchBarSelectedScopeButtonIndexDidChangeBlock;

@end
