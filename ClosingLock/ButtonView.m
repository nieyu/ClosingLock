//
//  ButtonView.m
//  ClosingLock
//
//  Created by nieyu on 15/7/16.
//  Copyright (c) 2015年 nieyu. All rights reserved.
//

#import "ButtonView.h"
#import "UIControl+NYUIButton.h"
#import "QuestionMarkImage.h"

@interface ButtonView()

@property (nonatomic, strong) NSString          *title;
@property (nonatomic, strong) UIImage           *image;
@property (nonatomic, assign) float             radius;

@property (nonatomic, strong) UIButton          *button;
@property (nonatomic, strong) UILabel           *titleLabel;
@property (nonatomic, strong) UIImageView       *buttonImageView;

@end

@implementation ButtonView

/** init button method */
-(id)initButtonViewWithFrame:(CGRect)frame
                   withTitle:(NSString *)title
                   withImage:(UIImage *)image
                  withRadius:(CGFloat)radius
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setTitle:title];
        [self setImage:image];
        [self setRadius:radius];
        [self setButton:nil];
    }
    return self;
}

-(void)setTitle:(NSString *)title {
    _title = title;
}

-(void)setImage:(UIImage *)image {
    _image = image;
    [self setButtonImageView:[[UIImageView alloc] initWithFrame:self.frame]];
    QuestionMarkImage *view = [[QuestionMarkImage alloc] init];
    [self addSubview:view];
}

-(void)setRadius:(float)radius {
    _radius = radius;
    [self.layer setCornerRadius:_radius];
}

-(void)setTitleLabel:(UILabel *)titleLabel {
    _titleLabel = titleLabel;
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    }
    [_titleLabel setText:_title];
    [self addSubview:_titleLabel];
}

-(void)setButtonImageView:(UIImageView *)buttonImageView {
    _buttonImageView = buttonImageView;
    if (_buttonImageView == nil) {
        _buttonImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    [_buttonImageView setImage:_image];
    [self addSubview:_buttonImageView];
}

-(void)setButton:(UIButton *)button {
    _button = button;
    if (!button) {
        _button = [[UIButton alloc] initWithFrame:self.bounds];
    }
    [self addSubview:_button];
}

-(void)setType:(NYButtonViewType)type {
    switch (type) {
        case NYNormal:
            break;
        case NYCircle:
            [self setRadius:self.frame.size.width / 2];
            break;
        case NYClear:
            [self setRadius:self.frame.size.width / 2];
            
            break;
        default:
            break;
    }
}

/**
 *  method : add  handle
 *
 *  param  : event
 *
 *  param  : sender is a block
 */
- (void)handlevControlWithUIControl:(UIControlEvents)event
                         withBlock:(void(^)(id sender))block
{
    WEAKSELF;
    [_button handleControlWithUIControl:event withBlock:^(id sender) {
        DLog(@"hehe");
        if (sender) {
            block(weakSelf);
        }
    }];
}

/**
 *  method : remove target
 *
 *  param  : event
 */
- (void)removeHandleForEvent:(UIControlEvents)event
{
    
}

@end
