//
//  WLTabBar.h
//
//  Created by wanglei on 15/10/19.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WLTabBarDelegate <NSObject>
-(void)changViewControllerFrom:(NSInteger)lastIndex to:(NSInteger)currentIndex;
-(void)clickAddButton;
@end

@interface WLTabBar : UIView
@property (nonatomic, weak) id<WLTabBarDelegate> delegate;
-(void)addButtonWithItem:(UITabBarItem *)tabBarItem;
@end



