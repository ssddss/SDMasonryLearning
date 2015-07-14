//
//  MASExampleAttributeChainingView.m
//  SDMasonryLearning
//
//  Created by ssdd on 15/7/14.
//  Copyright (c) 2015年 ssdd. All rights reserved.
//

#import "MASExampleAttributeChainingView.h"

@implementation MASExampleAttributeChainingView

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
    UIEdgeInsets padding = UIEdgeInsetsMake(15, 10, 15, 10);
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(superview).insets(padding);
        
        make.right.equalTo(redView.left).insets(padding);
        make.width.equalTo(redView.width);
        make.bottom.equalTo(blueView.top).insets(padding);
        make.height.equalTo(@[redView, blueView]);
    }];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.equalTo(superview).insets(padding);
        make.left.equalTo(greenView.right).insets(padding);
        make.width.equalTo(greenView.width);
        make.height.equalTo(@[greenView, blueView]);
        make.bottom.equalTo(blueView.mas_top).insets(padding);

    }];
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).insets(padding);
        make.left.right.and.bottom.equalTo(superview).insets(padding);
        make.height.equalTo(@[greenView,redView]);
    }];
    
    return self;
}
@end
