//
//  SecondViewController.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2020/6/13.
//  Copyright © 2020 LXF. All rights reserved.
//

#import "SecondViewController.h"
#import "UIViewController+LifeCycle.h"

@interface SecondViewController () <UITextFieldDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(50, 200, 200, 40);
    textField.backgroundColor = [UIColor systemPinkColor];
    [self.view addSubview:textField];
    textField.delegate = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    UIViewControllerLifeCycle lifeCycle = self.lifeCycle;
    NSLog(@"lifeCycle -- %ld", lifeCycle);
}

@end
