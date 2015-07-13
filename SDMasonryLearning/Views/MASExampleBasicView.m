//
//  MASExampleBasicView.m
//  SDMasonryLearning
//
//  Created by ssdd on 15/7/13.
//  Copyright (c) 2015年 ssdd. All rights reserved.
//

#import "MASExampleBasicView.h"

@implementation MASExampleBasicView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    if (self = [super init]) {
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
        int padding = 10;
        
        [greenView makeConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo(superview.top).offset(padding);
            make.left.equalTo(superview.left).offset(padding);
            make.bottom.equalTo(blueView.top).offset(-padding);
            make.right.equalTo(redView.left).offset(-padding);
            make.width.equalTo(redView.width);
            
            make.height.equalTo(redView.height);
            make.height.equalTo(blueView.height);
        }];
        
        [redView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview.mas_top).with.offset(padding);
            make.left.equalTo(greenView.mas_right).offset(padding);
            make.bottom.equalTo(blueView.mas_top).offset(-padding);
            make.right.equalTo(superview.mas_right).offset(-padding);
            
            make.width.equalTo(greenView.mas_width);
            make.height.equalTo(@[greenView,blueView]);
        }];
        
        [blueView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(greenView.bottom).offset(padding);
            make.left.equalTo(superview.left).offset(padding);
            make.right.equalTo(superview.right).offset(-padding);
            make.bottom.equalTo(superview.bottom).offset(-padding);
            
            make.height.equalTo(@[greenView,redView]);
        }];
    }
    return self;
}
@end
