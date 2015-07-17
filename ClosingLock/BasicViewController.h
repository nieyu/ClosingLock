//
//  BasicViewController.h
//  ClosingLock
//
//  Created by nieyu on 15/7/16.
//  Copyright (c) 2015年 nieyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController

@property (nonatomic, assign) BOOL      showBackground;         //whether show background, default is YES
@property (nonatomic, assign) BOOL      showNavigationBar;      //whether show  navigationBar, default is YES
@property (nonatomic, strong) UIColor   *basicBackgroundColor;  

- (void)leftNavigationBarAction;
- (void)rightNavigationBarAction;

@end
