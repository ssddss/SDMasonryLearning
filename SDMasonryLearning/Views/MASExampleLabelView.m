//
//  MASExampleLabelView.m
//  SDMasonryLearning
//
//  Created by ssdd on 15/7/16.
//  Copyright (c) 2015年 ssdd. All rights reserved.
//

#import "MASExampleLabelView.h"
static UIEdgeInsets const kPadding = {10, 10, 10, 10};

@interface MASExampleLabelView ()

@property (nonatomic, strong) UILabel *shortLabel;
@property (nonatomic, strong) UILabel *longLabel;
@property (nonatomic, strong) UILabel *underLongLabel;

@end
@implementation MASExampleLabelView

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
    
    self.shortLabel = UILabel.new;
    self.shortLabel.numberOfLines = 1;
    self.shortLabel.textColor = [UIColor purpleColor];
    self.shortLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.shortLabel.text = @"Bacon";
    [self addSubview:self.shortLabel];
    
    self.longLabel = UILabel.new;
    self.longLabel.numberOfLines = 8;
    self.longLabel.textColor = [UIColor darkGrayColor];
    self.longLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.longLabel.text = @"Bacon ipsum dolor sit amet spare ribs fatback kielbasa salami, tri-tip jowl pastrami flank short loin rump sirloin. Tenderloin frankfurter chicken biltong rump chuck filet mignon pork t-bone flank ham hock.";
    [self addSubview:self.longLabel];
    
    self.underLongLabel = UILabel.new;
    self.underLongLabel.numberOfLines = 1;
    self.underLongLabel.textColor = [UIColor blackColor];
    self.underLongLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.underLongLabel.text = @"Balala";
    [self addSubview:self.underLongLabel];
    
    [self layoutPageSubviews];
    
    return self;
}
- (void)layoutPageSubviews {
    
    MASAttachKeys(self.longLabel,self.shortLabel,self.underLongLabel);
    
    [self.longLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).insets(kPadding);
        make.top.equalTo(self.top).insets(kPadding);
    }];
    
    [self.shortLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.longLabel.centerY);
        make.right.equalTo(self.right).insets(kPadding);

    }];
    
    [self.underLongLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.longLabel.centerX);
        make.top.equalTo(self.longLabel.bottom).offset(20);
    }];

}
- (void)layoutSubviews {
    [super layoutSubviews];
    
        CGFloat width = CGRectGetMinX(self.shortLabel.frame) - kPadding.left;
        width -= CGRectGetMinX(self.longLabel.frame);
        self.longLabel.preferredMaxLayoutWidth = width;
    
    [super layoutSubviews];
}
@end
