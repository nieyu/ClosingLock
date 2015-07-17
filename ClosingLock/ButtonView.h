//
//  ButtonView.h
//  ClosingLock
//
//  Created by nieyu on 15/7/16.
//  Copyright (c) 2015年 nieyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NYNormal      = 0,  //default
    NYCircle,           //circle
    NYClear,            //has no outline
}NYButtonViewType;

@interface ButtonView : UIView
/** button type */
@property (nonatomic, assign) NYButtonViewType  type;

/** init button method */
-(id)initButtonViewWithFrame:(CGRect)frame
                   withTitle:(NSString *)title
                   withImage:(UIImage *)image
                  withRadius:(CGFloat)radius;

/**
 *  method : add  handle
 *
 *  param  : event
 *
 *  param  : sender is a block
 */
- (void)handlevControlWithUIControl:(UIControlEvents)event
                         withBlock:(void(^)(id sender))block;

/**
 *  method : remove target
 *
 *  param  : event
 */
- (void)removeHandleForEvent:(UIControlEvents)event;

@end
