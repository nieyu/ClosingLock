//
//  BasicViewController.m
//  ClosingLock
//
//  Created by nieyu on 15/7/16.
//  Copyright (c) 2015年 nieyu. All rights reserved.
//

#import "BasicViewController.h"
#import "GradientView.h"


@interface BasicViewController ()

@end

@implementation BasicViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        [self setShowBackground:YES];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setShowBackground:(BOOL)showBackground {
    _showBackground = showBackground;
    if (_showBackground) {
        [self setBasicBackgroundColor:[UIColor greenColor]];
    } else {
        [self setBasicBackgroundColor:[UIColor clearColor]];
    }
}

-(void)setShowNavigationBar:(BOOL)showNavigationBar
{
    _showNavigationBar = showNavigationBar;
    if (_showNavigationBar) {
        
    } else {
        
    }
}

- (void)setBasicBackgroundColor:(UIColor *)basicBackgroundColor
{
    _basicBackgroundColor = basicBackgroundColor;
    if (_basicBackgroundColor != [UIColor clearColor]) {
        NSMutableArray *colorArray = [NSMutableArray array];
        [colorArray addObject:[UIColor colorWithRed:.0 green:.8 blue:.8 alpha:.836]];
        [colorArray addObject:[UIColor colorWithRed:.9 green:.8 blue:1.0 alpha:.836]];
        GradientView *backgroundView = [[GradientView alloc] initWithFrame:self.view.bounds
                                                            fromColorArray:colorArray
                                                            byGradientType:topToBottom];
        [self.view addSubview:backgroundView];
        [self.view sendSubviewToBack:backgroundView];
    } else {
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
}

- (void)leftNavigationBarAction
{
    
}

- (void)rightNavigationBarAction
{
    
}

- (void)setBackgroundColorFromColors:(NSArray *)colors
                      byGradientType:(GradientType)gradientType
{
    CGRect rect = self.view.frame;
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = rect;
    NSMutableArray *array = [NSMutableArray array];
    for (UIColor *color in colors) {
        [array addObject:(id)color];
    }
    gradient.colors = array;
    [self.view.layer insertSublayer:gradient atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
