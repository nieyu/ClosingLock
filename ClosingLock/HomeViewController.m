 //
//  HomeViewController.m
//  ClosingLock
//
//  Created by nieyu on 15/7/16.
//  Copyright (c) 2015年 nieyu. All rights reserved.
//

#import "HomeViewController.h"
#import "ButtonView.h"
#import "QuestionMarkImage.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ButtonView *buttonView = [[ButtonView alloc] initButtonViewWithFrame:CGRectMake(20, 200, 60, 60)
                                                               withTitle:@"abc"
                                                               withImage:nil
                                                              withRadius:0];
    [buttonView setBackgroundColor:[UIColor clearColor]];
    [buttonView setType:NYClear];
    [buttonView handlevControlWithUIControl:UIControlEventTouchUpInside withBlock:^(id sender) {
        DLog(@"efg");
    }];
    QuestionMarkImage *image = [[QuestionMarkImage alloc] initWithFrame:buttonView.bounds];
    [image setShapeColor:[UIColor greenColor]];
    [buttonView addSubview:image];
    [buttonView bringSubviewToFront:image];
    [self.view addSubview:buttonView];
    [self.view setNeedsDisplay];
}

- (void)dealloc {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
