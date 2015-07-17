//
//  GradientView.h
//  ClosingLock
//
//  Created by nieyu on 15/7/16.
//  Copyright (c) 2015年 nieyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    topToBottom         = 0,    //上 -> 下
    leftToRight,                //左 -> 右
    upleftToLowRight,           //上左 -> 右下
    uprightToLowleft            //上右 -> 左下
}GradientType;

@interface GradientView : UIView
//!@brief 建议颜色设置为2个相近色为佳，设置3个相近色能形成拟物化的凸起感
- (id)initWithFrame:(CGRect)frame
     fromColorArray:(NSMutableArray*)colorArray
     byGradientType:(GradientType)gradientType;
@end
