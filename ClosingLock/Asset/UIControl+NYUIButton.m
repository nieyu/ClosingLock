//
//  UIControl+NYUIButton.m
//  ClosingLock
//
//  Created by nieyu on 15/7/16.
//  Copyright (c) 2015年 nieyu. All rights reserved.
//

#import "UIControl+NYUIButton.h"
#import <objc/runtime.h>

static char OperationKey;

@implementation UIControl (NYUIButton)

- (void)handleControlWithUIControl:(UIControlEvents)event withBlock:(void(^)(id sender))block
{
    NSString *methodName = [UIControl eventName:event];
    NSMutableDictionary *operations = (NSMutableDictionary *)objc_getAssociatedObject(self, &OperationKey);
    if (nil == operations) {
        operations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, operations, OBJC_ASSOCIATION_RETAIN);
    }
    [operations setObject:block forKey:methodName];
    [self addTarget:self action:NSSelectorFromString(methodName) forControlEvents:event];
}

- (void)removeHandleForEvent:(UIControlEvents)event
{
    NSString *methodName = [UIControl eventName:event];
    NSMutableDictionary *operations = (NSMutableDictionary *)objc_getAssociatedObject(self, &OperationKey);
    if (nil == operations) {
        operations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, operations, OBJC_ASSOCIATION_RETAIN);
    }
    [operations removeObjectForKey:methodName];
    [self removeTarget:self action:NSSelectorFromString(methodName) forControlEvents:event];
}

-(void)UIControlEventTouchDown              {[self callActionBlock:UIControlEventTouchDown];}
-(void)UIControlEventTouchDownRepeat        {[self callActionBlock:UIControlEventTouchDownRepeat];}
-(void)UIControlEventTouchDragInside        {[self callActionBlock:UIControlEventTouchDragInside];}
-(void)UIControlEventTouchDragOutside       {[self callActionBlock:UIControlEventTouchDragOutside];}
-(void)UIControlEventTouchDragEnter         {[self callActionBlock:UIControlEventTouchDragEnter];}
-(void)UIControlEventTouchDragExit          {[self callActionBlock:UIControlEventTouchDragExit];}
-(void)UIControlEventTouchUpInside          {[self callActionBlock:UIControlEventTouchUpInside];}
-(void)UIControlEventTouchUpOutside         {[self callActionBlock:UIControlEventTouchUpOutside];}
-(void)UIControlEventTouchCancel            {[self callActionBlock:UIControlEventTouchCancel];}
-(void)UIControlEventValueChanged           {[self callActionBlock:UIControlEventValueChanged];}
-(void)UIControlEventEditingDidBegin        {[self callActionBlock:UIControlEventEditingDidBegin];}
-(void)UIControlEventEditingChanged         {[self callActionBlock:UIControlEventEditingChanged];}
-(void)UIControlEventEditingDidEnd          {[self callActionBlock:UIControlEventEditingDidEnd];}
-(void)UIControlEventEditingDidEndOnExit    {[self callActionBlock:UIControlEventEditingDidEndOnExit];}
-(void)UIControlEventAllTouchEvents         {[self callActionBlock:UIControlEventAllTouchEvents];}
-(void)UIControlEventAllEditingEvents       {[self callActionBlock:UIControlEventAllEditingEvents];}
-(void)UIControlEventApplicationReserved    {[self callActionBlock:UIControlEventApplicationReserved];}
-(void)UIControlEventSystemReserved         {[self callActionBlock:UIControlEventSystemReserved];}
-(void)UIControlEventAllEvents              {[self callActionBlock:UIControlEventAllEvents];}

- (void)callActionBlock:(UIControlEvents)event {
    NSMutableDictionary *operations = (NSMutableDictionary *)objc_getAssociatedObject(self, &OperationKey);
    
    if (nil == operations) {
        return;
    }
    
    void(^block)(id sender) = [operations objectForKey:[UIControl eventName:event]];
    if (block) {
        block(self);
    }
}

+ (NSString *)eventName:(UIControlEvents)event
{
    switch (event) {
        case UIControlEventAllEditingEvents:        return @"UIControlEventAllEditingEvents";
        case UIControlEventAllTouchEvents:          return @"UIControlEventAllTouchEvents";
        case UIControlEventAllEvents:               return @"UIControlEventAllEvents";
        case UIControlEventApplicationReserved:     return @"UIControlEventApplicationReserved";
        case UIControlEventEditingChanged:          return @"UIControlEventEditingChanged";
        case UIControlEventEditingDidBegin:         return @"UIControlEventEditingDidBegin";
        case UIControlEventEditingDidEnd:           return @"UIControlEventEditingDidEnd";
        case UIControlEventEditingDidEndOnExit:     return @"UIControlEventEditingDidEndOnExit";
        case UIControlEventSystemReserved:          return @"UIControlEventSystemReserved";
        case UIControlEventTouchCancel:             return @"UIControlEventTouchCancel";
        case UIControlEventTouchDown:               return @"UIControlEventTouchDown";
        case UIControlEventTouchDownRepeat:         return @"UIControlEventTouchDownRepeat";
        case UIControlEventTouchDragEnter:          return @"UIControlEventTouchDragEnter";
        case UIControlEventTouchDragExit:           return @"UIControlEventTouchDragExit";
        case UIControlEventTouchDragInside:         return @"UIControlEventTouchDragInside";
        case UIControlEventTouchDragOutside:        return @"UIControlEventTouchDragOutside";
        case UIControlEventTouchUpInside:           return @"UIControlEventTouchUpInside";
        case UIControlEventTouchUpOutside:          return @"UIControlEventTouchUpOutside";
        case UIControlEventValueChanged:            return @"UIControlEventValueChanged";
            
        default:                                    return @"description";
    }
    return @"description";
}

+ (UIControlEvents)eventWithName:(NSString *)name
{
    if([name isEqualToString:@"UIControlEventTouchDown"])           return UIControlEventTouchDown;
    if([name isEqualToString:@"UIControlEventTouchDownRepeat"])     return UIControlEventTouchDownRepeat;
    if([name isEqualToString:@"UIControlEventTouchDragInside"])     return UIControlEventTouchDragInside;
    if([name isEqualToString:@"UIControlEventTouchDragOutside"])    return UIControlEventTouchDragOutside;
    if([name isEqualToString:@"UIControlEventTouchDragEnter"])      return UIControlEventTouchDragEnter;
    if([name isEqualToString:@"UIControlEventTouchDragExit"])       return UIControlEventTouchDragExit;
    if([name isEqualToString:@"UIControlEventTouchUpInside"])       return UIControlEventTouchUpInside;
    if([name isEqualToString:@"UIControlEventTouchUpOutside"])      return UIControlEventTouchUpOutside;
    if([name isEqualToString:@"UIControlEventTouchCancel"])         return UIControlEventTouchCancel;
    if([name isEqualToString:@"UIControlEventTouchDown"])           return UIControlEventTouchDown;
    if([name isEqualToString:@"UIControlEventValueChanged"])        return UIControlEventValueChanged;
    if([name isEqualToString:@"UIControlEventEditingDidBegin"])     return UIControlEventEditingDidBegin;
    if([name isEqualToString:@"UIControlEventEditingChanged"])      return UIControlEventEditingChanged;
    if([name isEqualToString:@"UIControlEventEditingDidEnd"])       return UIControlEventEditingDidEnd;
    if([name isEqualToString:@"UIControlEventEditingDidEndOnExit"]) return UIControlEventEditingDidEndOnExit;
    if([name isEqualToString:@"UIControlEventAllTouchEvents"])      return UIControlEventAllTouchEvents;
    if([name isEqualToString:@"UIControlEventAllEditingEvents"])    return UIControlEventAllEditingEvents;
    if([name isEqualToString:@"UIControlEventApplicationReserved"]) return UIControlEventApplicationReserved;
    if([name isEqualToString:@"UIControlEventSystemReserved"])      return UIControlEventSystemReserved;
    if([name isEqualToString:@"UIControlEventAllEvents"])           return UIControlEventAllEvents;
    return UIControlEventAllEvents;
}

@end
