//
//  WLTabBarController.h
//
//  Created by wanglei on 15/10/14.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLTabBarController : UITabBarController

//-(void)addViewControllersWithVC:(UIViewController *)vc
//                          Title:(NSString *)title
//                      imageName:(NSString *)imageName
//              selectedImageName:(NSString *)selectedImageName;

- (void)addChildViewController:(UIViewController *)viewController
                         Title:(NSString *)title
                     imageName:(NSString *)imageName
             selectedImageName:(NSString *)selectedImageName;

@end
