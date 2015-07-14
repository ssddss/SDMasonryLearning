//
//  MASExampleArrayView.m
//  SDMasonryLearning
//
//  Created by ssdd on 15/7/14.
//  Copyright (c) 2015年 ssdd. All rights reserved.
//

#import "MASExampleArrayView.h"
static CGFloat const kArrayExampleIncrement = 10.0;
@interface MASExampleArrayView ()

@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, strong) NSArray *buttonViews;

@end
@implementation MASExampleArrayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    UIButton *raiseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [raiseButton setTitle:@"Raise" forState:UIControlStateNormal];
    [raiseButton addTarget:self action:@selector(raiseAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:raiseButton];
    
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [centerButton setTitle:@"Center" forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(centerAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:centerButton];
    
    UIButton *lowerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [lowerButton setTitle:@"Lower" forState:UIControlStateNormal];
    [lowerButton addTarget:self action:@selector(lowerAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:lowerButton];
    
    [raiseButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-10);
    }];
    
    [centerButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
    }];
    
    [lowerButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
    }];
    self.buttonViews = @[ raiseButton, lowerButton, centerButton ];

    
    return self;
}
- (void)centerAction {
    self.offset = 0.0;
}

- (void)raiseAction {
    self.offset -= kArrayExampleIncrement;
}

- (void)lowerAction {
    self.offset += kArrayExampleIncrement;
}
- (void)setOffset:(CGFloat)offset {
    _offset = offset;
    [self setNeedsUpdateConstraints];
}
- (void)updateConstraints {
    [self.buttonViews updateConstraints:^(MASConstraintMaker *make) {
        make.baseline.equalTo(self.centerY).with.offset(self.offset);
    }];
    [super updateConstraints];
}
@end
