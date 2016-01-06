//
//  WLTabBar.m
//
//  Created by wanglei on 15/10/19.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import "WLTabBar.h"
#import "WLTabBarButton.h"

@interface WLTabBar ()

@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@property (nonatomic, strong) WLTabBarButton *lastSelectedBtn;

@end

@implementation WLTabBar

-(NSMutableArray *)tabBarButtons{
    if (_tabBarButtons == nil) {
        NSMutableArray *arr = [NSMutableArray array];
        _tabBarButtons = arr;
    }
    return _tabBarButtons;
}

-(void)addButtonWithItem:(UITabBarItem *)tabBarItem{
    WLTabBarButton *btn = [WLTabBarButton buttonWithType:UIButtonTypeCustom];
    [btn setTabBarItem:tabBarItem];
    [self addSubview:btn];
    
    [self.tabBarButtons addObject:btn];
    btn.tag = self.tabBarButtons.count-1;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self btnClick:btn];//每添加一个btn, 加载一个VC里面的数据
    
    tabBarItem.tag = self.tabBarButtons.count-1;
    [tabBarItem addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
}

-(void)btnClick:(WLTabBarButton *)btn{
    
    if (btn.tag == 10000) {
        
        if ([self.delegate respondsToSelector:@selector(clickAddButton)]) {
            [self.delegate clickAddButton];
        }
        
    }else{
        if ([self.delegate respondsToSelector:@selector(changViewControllerFrom:to:)]) {
            [self.delegate changViewControllerFrom:self.lastSelectedBtn.tag to:btn.tag];
        }
        
        self.lastSelectedBtn.selected = NO;
        btn.selected = YES;
        self.lastSelectedBtn = btn;
    }
    
}

-(void)layoutSubviews{
    
    CGFloat btnW = self.bounds.size.width/self.tabBarButtons.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnY = 0;
    
    //平分布局, 不加中间按钮
//    for (int index = 0; index < self.tabBarButtons.count; index++) {
//        WLTabBarButton *btn = (WLTabBarButton *)self.tabBarButtons[index];
//        btn.frame = CGRectMake(btnW * index, btnY, btnW, btnH);
//        btn.tag = index;
//        btn.badgeValue = btn.tabBarItem.badgeValue;
//        btn.selected = NO;
//        if (index==0) {
//            btn.selected = YES;//默认选中第一个按钮
//            self.lastSelectedBtn = btn;
//        }
//    }
    
    //中间加按钮
    btnW = (self.bounds.size.width-72)/self.tabBarButtons.count;
    for (int index = 0; index < self.tabBarButtons.count; index++) {
        WLTabBarButton *btn = (WLTabBarButton *)self.tabBarButtons[index];
        if (index == 0) {
            btn.frame = CGRectMake(btnW * index, btnY, btnW, btnH);
        }else{
            btn.frame = CGRectMake(btnW * index + 72, btnY, btnW, btnH);
        }
        btn.tag = index;
        btn.badgeValue = btn.tabBarItem.badgeValue;
        btn.selected = NO;
        if (index==0) {
            btn.selected = YES;//默认选中第一个按钮
            self.lastSelectedBtn = btn;
        }
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(btnW, 49-70, 70, 70);
    [btn setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    btn.tag = 10000;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"badgeValue"]) {
        UITabBarItem *item = object;
        for (int i = 0; i < self.tabBarButtons.count; i++) {
            if (item.tag == i) {
                WLTabBarButton *btn = self.tabBarButtons[i];
                btn.badgeValue = item.badgeValue;
            }
        }
    }
}

@end
