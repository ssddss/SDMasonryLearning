//
//  MASExampleRemakeView.m
//  SDMasonryLearning
//
//  Created by ssdd on 15/7/14.
//  Copyright (c) 2015年 ssdd. All rights reserved.
//

#import "MASExampleRemakeView.h"
@interface MASExampleRemakeView ()
@property (nonatomic, strong) UIButton *movingButton;
@property (nonatomic, assign) BOOL topLeft;
@end
@implementation MASExampleRemakeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.movingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.movingButton setTitle:@"Move Me!" forState:UIControlStateNormal];
    self.movingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.movingButton.layer.borderWidth = 3;
    
    [self.movingButton addTarget:self action:@selector(toggleButtonPosition) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.movingButton];
    
    self.topLeft = YES;

    return self;
}
+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}
- (void)updateConstraints {
    [self.movingButton remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@100);
        if (self.topLeft) {
            make.left.equalTo(@10);
            make.top.equalTo(@10);
        }
        else {
            make.right.equalTo(@-10);
            make.bottom.equalTo(@-10);
        }
    }];
    [super updateConstraints];
}
- (void)toggleButtonPosition {
    self.topLeft = !self.topLeft;
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}
@end
