//
//  HomeViewController.m
//  ClosingLock
//
//  Created by nieyu on 15/7/16.
//  Copyright (c) 2015年 nieyu. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 40, 100, 100)];
    [button setBackgroundColor:[UIColor blackColor]];
    [button handleControlWithUIControl:UIControlEventTouchUpInside withBlock:^(id sender) {
        NSLog(@"abc");
    }];
    [self.view addSubview:button];
}

- (void)dealloc {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
