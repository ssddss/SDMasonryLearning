//
//  MASExampleAspectFitView.m
//  SDMasonryLearning
//
//  Created by ssdd on 15/7/15.
//  Copyright (c) 2015年 ssdd. All rights reserved.
//

#import "MASExampleAspectFitView.h"
@interface MASExampleAspectFitView ()
@property (nonatomic)  UIView *topView;
@property (nonatomic) UIView *topInnerView;
@property (nonatomic) UIView *bottomView;
@property (nonatomic) UIView *bottomInnerView;
@end
@implementation MASExampleAspectFitView
- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    [self addSubview:self.topView];
    [self.topView addSubview:self.topInnerView];
    [self addSubview:self.bottomView];
    [self.bottomView addSubview:self.bottomInnerView];
    
    [self layoutPageSubviews];
    
    return self;
}
#pragma mark - private methods
- (void)layoutPageSubviews {
    [self.topView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.and.right.equalTo(self);
//        make.height.equalTo(@100);
    }];
    
    [self.bottomView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(self);
        make.top.equalTo(self.topView.bottom);
        make.height.equalTo(self.topView.height);
    }];
    // Inner views are configured for aspect fit with ratio of 3:1

    [self.topInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        //跟自己比
        make.width.equalTo(self.topInnerView.height).dividedBy(3);
        
        make.width.and.height.lessThanOrEqualTo(self.topView);
        make.width.and.height.equalTo(self.topView).with.priorityLow();
        make.center.equalTo(self.topView);
    }];
    
    [self.bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.bottomInnerView.mas_width).multipliedBy(3);
        make.height.equalTo(@60);
//        make.width.equalTo(@20);
//        make.width.and.height.lessThanOrEqualTo(self.bottomView);
//        make.width.and.height.equalTo(self.bottomView).with.priorityLow();
        
        make.center.equalTo(self.bottomView);
    }];
}
#pragma mark - getters and setters
- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectZero];
        UIColor *blueColor = [UIColor colorWithRed:0.663 green:0.796 blue:0.996 alpha:1];
        [_topView setBackgroundColor:blueColor];
    }
    return _topView;
}
- (UIView *)topInnerView {
    if (!_topInnerView) {
        _topInnerView = [[UIView alloc]initWithFrame:CGRectZero];
        UIColor *lightGreenColor = [UIColor colorWithRed:0.784 green:0.992 blue:0.851 alpha:1];
        [_topInnerView setBackgroundColor:lightGreenColor];
    }
    return _topInnerView;
}
- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectZero];
        UIColor *pinkColor = [UIColor colorWithRed:0.992 green:0.804 blue:0.941 alpha:1];
        [_bottomView setBackgroundColor:pinkColor];
    }
    return _bottomView;
}
- (UIView *)bottomInnerView {
    if (!_bottomInnerView) {
        _bottomInnerView = [[UIView alloc]initWithFrame:CGRectZero];
        UIColor *darkGreenColor = [UIColor colorWithRed:0.443 green:0.780 blue:0.337 alpha:1];
        [_bottomInnerView setBackgroundColor:darkGreenColor];
    }
    return _bottomInnerView;
}
@end
