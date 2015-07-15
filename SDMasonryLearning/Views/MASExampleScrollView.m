//
//  MASExampleScrollView.m
//  SDMasonryLearning
//
//  Created by ssdd on 15/7/15.
//  Copyright (c) 2015年 ssdd. All rights reserved.
//

#import "MASExampleScrollView.h"
@interface MASExampleScrollView ()
@property (strong, nonatomic) UIScrollView* scrollView;
@end
@implementation MASExampleScrollView

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
    [self addSubview:self.scrollView];
    [self layoutPageSubviews];
    [self generateContent];
    return self;
}
- (void)layoutPageSubviews {
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
- (void)generateContent {
    UIView* contentView = UIView.new;
    [self.scrollView addSubview:contentView];
    
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    UIView *lastView;
    CGFloat height = 25;
    
    for (int i = 0; i < 10; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        [contentView addSubview:view];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        [view addGestureRecognizer:singleTap];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastView ? lastView.bottom : @0);
            make.left.equalTo(@0);
            make.width.equalTo(contentView.width);
            make.height.equalTo(@(height));
        }];
        
        height += 25;
        lastView = view;
    }
    
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.bottom);
    }];
}
- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)singleTap:(UITapGestureRecognizer*)sender {
    [sender.view setAlpha:sender.view.alpha / 1.20]; // To see something happen on screen when you tap :O
    [self.scrollView scrollRectToVisible:sender.view.frame animated:YES];
};
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = UIScrollView.new;
        _scrollView.backgroundColor = [UIColor grayColor];

    }
    return _scrollView;
}
@end
