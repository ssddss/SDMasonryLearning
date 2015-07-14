//
//  MASExampleConstantsView.m
//  SDMasonryLearning
//
//  Created by ssdd on 15/7/13.
//  Copyright (c) 2015年 ssdd. All rights reserved.
//

#import "MASExampleConstantsView.h"

@implementation MASExampleConstantsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    if (self = [super init]) {
        UIView *purpleView = UIView.new;
        purpleView.backgroundColor = UIColor.purpleColor;
        purpleView.layer.borderColor = UIColor.blackColor.CGColor;
        purpleView.layer.borderWidth = 2;
        [self addSubview:purpleView];
        
        UIView *orangeView = UIView.new;
        orangeView.backgroundColor = UIColor.orangeColor;
        orangeView.layer.borderColor = UIColor.blackColor.CGColor;
        orangeView.layer.borderWidth = 2;
        [purpleView addSubview:orangeView];
        
        [purpleView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@20);
            make.left.equalTo(@20);
            make.right.equalTo(@-20);
            make.bottom.equalTo(@-20);
        }];
        
        [orangeView makeConstraints:^(MASConstraintMaker *make) {
            //这个距离的是父view的中心点
            make.center.equalTo(CGPointMake(-50, 0));
            make.size.equalTo(CGSizeMake(200, 100));
        }];
    }
    return self;
}
@end
