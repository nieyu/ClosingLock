//
//  GradientView.m
//  ClosingLock
//
//  Created by nieyu on 15/7/16.
//  Copyright (c) 2015年 nieyu. All rights reserved.
//

#import "GradientView.h"
#import <QuartzCore/QuartzCore.h>

@implementation GradientView

//!@brief 建议颜色设置为2个相近色为佳，设置3个相近色能形成拟物化的凸起感
- (id)initWithFrame:(CGRect)frame
     fromColorArray:(NSMutableArray*)colorArray
     byGradientType:(GradientType)gradientType
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:[self backgroundImageViewFromColors:colorArray byGradientType:gradientType]];
    }
    return self;
}

- (CAGradientLayer *)gradientLayerInsertWithColors:(NSMutableArray *) colorArray;
{
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    CGRect rect = self.frame;
    [gradientLayer setFrame:rect];
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[UIColor redColor].CGColor,
                            (id)[UIColor yellowColor].CGColor,
                            (id)[UIColor greenColor].CGColor,nil];;
    return gradientLayer;
}

//core
- (UIImageView *)backgroundImageViewFromColors:(NSArray *)colors
                                byGradientType:(GradientType)gradientType
{
    NSMutableArray *array = [NSMutableArray array];
    for (UIColor *color in colors) {
        [array addObject:(id)color.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(self.frame.size, YES, 1.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)array, NULL);
    
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case topToBottom:
            start   = CGPointMake(.0, .0);
            end     = CGPointMake(.0, self.frame.size.height);
            break;
        case leftToRight:
            start   = CGPointMake(.0, .0);
            end     = CGPointMake(self.frame.size.width, 0);
            break;
        case upleftToLowRight:
            start   = CGPointMake(.0, .0);
            end     = CGPointMake(self.frame.size.width, self.frame.size.height);
            break;
        case uprightToLowleft:
            start   = CGPointMake(self.frame.size.width, .0);
            end     = CGPointMake(0, self.frame.size.height);
        default:
            break;
    }
    
    CGContextDrawLinearGradient(context,
                                gradient,
                                start,
                                end,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [imageView setImage:image];
    return imageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
