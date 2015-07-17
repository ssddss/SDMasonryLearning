//
//  MASExampleAnimatedView.m
//  SDMasonryLearning
//
//  Created by yurongde on 15/7/17.
//  Copyright (c) 2015年 ssdd. All rights reserved.
//

#import "MASExampleAnimatedView.h"
@interface MASExampleAnimatedView ()

@property (nonatomic, strong) NSMutableArray *animatableConstraints;
@property (nonatomic, assign) int padding;
@property (nonatomic, assign) BOOL animating;

@end

@implementation MASExampleAnimatedView

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
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self addSubview:blueView];
    
    UIView *superview = self;
    int padding = self.padding = 10;
    UIEdgeInsets paddingInsets = UIEdgeInsetsMake(self.padding, self.padding, self.padding, self.padding);
    self.animatableConstraints = NSMutableArray.new;
    MASAttachKeys(greenView,redView,blueView);
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        [self.animatableConstraints addObjectsFromArray:@[
           make.edges.equalTo(self).insets(paddingInsets).priorityLow(),
           make.bottom.equalTo(blueView.top).offset(-padding)
           ]];
        make.size.equalTo(redView);
        make.height.equalTo(blueView.height);
    }];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        [self.animatableConstraints addObjectsFromArray:@[
            make.edges.equalTo(superview).insets(paddingInsets).priorityLow(),
            make.left.equalTo(greenView.right).offset(padding),
            make.bottom.equalTo(blueView.top).offset(-padding)
                                                          ]];
        make.size.equalTo(greenView);
        make.height.equalTo(blueView.height);
    }];
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        [self.animatableConstraints addObjectsFromArray:@[
            make.edges.equalTo(superview).insets(paddingInsets).priorityLow(),
//            make.left.equalTo(@(padding)),
//            make.right.equalTo(@(-padding)),
//            make.bottom.equalTo(@(-padding)),
//            make.top.equalTo(greenView.bottom).offset(padding),
//            make.top.equalTo(redView.bottom).offset(padding)
                                                          ]];
        make.height.equalTo(greenView.height);
        make.height.equalTo(redView);
    }];
    
    return self;
}
- (void)didMoveToWindow {
    [self layoutIfNeeded];
    
    if (self.window) {
        self.animating = YES;
        [self animateWithInvertedInsets:NO];
    }
}
- (void)willMoveToWindow:(UIWindow *)newWindow {
    self.animating = newWindow != nil;
}
- (void)animateWithInvertedInsets:(BOOL)invertedInsets {
    if (!self.animating) {
       return;
    }
    int padding = invertedInsets ? 100 : self.padding;
    UIEdgeInsets paddingInsets = UIEdgeInsetsMake(padding, padding, padding, padding);
    for (MASConstraint *constraint in self.animatableConstraints) {
        constraint.insets = paddingInsets;
    }
    
    [UIView animateWithDuration:1 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        //repeat!
        [self animateWithInvertedInsets:!invertedInsets];
    }];

}
@end
