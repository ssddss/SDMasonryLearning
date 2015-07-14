//
//  MASExampleUpdateView.m
//  SDMasonryLearning
//
//  Created by ssdd on 15/7/14.
//  Copyright (c) 2015年 ssdd. All rights reserved.
//

#import "MASExampleUpdateView.h"
@interface MASExampleUpdateView ()
@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) CGSize buttonSize;
@end
@implementation MASExampleUpdateView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    if (self = [super init]) {
        self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.growingButton setTitle:@"Grow Me!" forState:UIControlStateNormal];
        self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
        self.growingButton.layer.borderWidth = 3;
        
        [self.growingButton addTarget:self action:@selector(didTapGrowButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.growingButton];
        
        self.buttonSize = CGSizeMake(100, 100);
    }
    return self;
}
/**
 *  发布实现这个方法，不然不会updateconstraint
 *
 *  @return
 */
+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (void)updateConstraints {
    [self.growingButton updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(self.buttonSize.width)).priorityLow();
        make.height.equalTo(@(self.buttonSize.height)).priorityLow();
        make.width.lessThanOrEqualTo(self);
        make.height.lessThanOrEqualTo(self);
    }];
    
    [super updateConstraints];
}
- (void)didTapGrowButton:(UIButton *)button {
    self.buttonSize = CGSizeMake(self.buttonSize.width*1.3, self.buttonSize.height*1.3);
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
