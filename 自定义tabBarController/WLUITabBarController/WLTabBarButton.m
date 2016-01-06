//
//  WLTabBarButton.m
//
//  Created by wanglei on 15/10/19.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import "WLTabBarButton.h"

#define WLTabBarButtonImageHeithRatio 0.6

@interface WLTabBarButton()
@property (nonatomic, strong) UIImageView *badgeImageView;
@property (nonatomic, strong) UIButton *badgeBtn;
@end

@implementation WLTabBarButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIColor *normalColor = [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1];
        [self setTitleColor:normalColor forState:UIControlStateNormal];
        UIColor *selectedColor = [UIColor colorWithRed:234/255.0 green:103/255.0 blue:7/255.0 alpha:1];
        [self setTitleColor:selectedColor forState:UIControlStateSelected];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{
}

-(void)setTabBarItem:(UITabBarItem *)tabBarItem{
    _tabBarItem = tabBarItem;
    [self setTitle:_tabBarItem.title forState:UIControlStateNormal];
    [self setImage:_tabBarItem.image forState:UIControlStateNormal];
    [self setImage:_tabBarItem.selectedImage forState:UIControlStateSelected];
    [self setBackgroundImage:[UIImage imageNamed:@"btn_backImage"] forState:UIControlStateSelected];
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat btnH = contentRect.size.height;
    CGFloat btnW = contentRect.size.width;
    return CGRectMake(0, 3, btnW, btnH * WLTabBarButtonImageHeithRatio);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat btnH = contentRect.size.height;
    CGFloat btnW = contentRect.size.width;
    return CGRectMake(0, btnH * WLTabBarButtonImageHeithRatio, btnW, btnH * (1 - WLTabBarButtonImageHeithRatio));
}

-(void)setBadgeValue:(NSString *)badgeValue{
    
    _badgeValue = badgeValue;
    if (_badgeValue.length == 1) {
        [self.badgeBtn removeFromSuperview];
        NSString *text = _badgeValue;
        CGRect badge_frame = CGRectMake(self.bounds.size.width/2.0+10, 3, 15, 15);
        [self addBadgeWithFrame:badge_frame text:text];
    }else if(_badgeValue.length == 2){
        [self.badgeBtn removeFromSuperview];
        NSString *text = _badgeValue;
        CGRect badge_frame = CGRectMake(self.bounds.size.width/2.0+10, 3, 20, 15);
        [self addBadgeWithFrame:badge_frame text:text];
    }else if(_badgeValue.length >= 3){
        [self.badgeBtn removeFromSuperview];
        NSString *text = @"99+";
        CGRect badge_frame = CGRectMake(self.bounds.size.width/2.0+10, 3, 27, 15);
        [self addBadgeWithFrame:badge_frame text:text];
    }else {
        [self.badgeBtn removeFromSuperview];
    }

}

-(void)addBadgeWithFrame:(CGRect)frame text:(NSString *)text{
    UIButton *badgeBtn = [[UIButton alloc] initWithFrame:frame];
    UIImage *image = [UIImage imageNamed:@"circle.png"];
    if (text.length > 1) {
        image = [image stretchableImageWithLeftCapWidth:image.size.width/2.0 topCapHeight:0];
    }
    [badgeBtn setBackgroundImage:image forState:UIControlStateNormal];
    [badgeBtn setTitle:text forState:UIControlStateNormal];
    badgeBtn.selected = YES;
    [badgeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    badgeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.badgeBtn = badgeBtn;
    self.badgeBtn.userInteractionEnabled = NO;
    [self addSubview:self.badgeBtn];
}

@end












