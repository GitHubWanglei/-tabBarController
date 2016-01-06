//
//  WLTabBarButton.h
//
//  Created by wanglei on 15/10/19.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLTabBarButton : UIButton

@property (nonatomic, strong) UITabBarItem *tabBarItem;
@property (nonatomic, strong) NSString *badgeValue;

@end
