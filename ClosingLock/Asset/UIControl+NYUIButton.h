//
//  UIControl+NYUIButton.h
//  ClosingLock
//
//  Created by nieyu on 15/7/16.
//  Copyright (c) 2015年 nieyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (NYUIButton)

/**
 *  method : add  handle
 *
 *  param  : event
 *
 *  param  : sender is a block
 */
- (void)handleControlWithUIControl:(UIControlEvents)event withBlock:(void(^)(id sender))block;

/**
 *  method : remove target
 *
 *  param  : event
 */
- (void)removeHandleForEvent:(UIControlEvents)event;
@end
