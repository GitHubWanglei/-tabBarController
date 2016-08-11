//
//  TestTabBarController.m
//  自定义tabBarController
//
//  Created by lihongfeng on 16/8/11.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "TestTabBarController.h"

@interface TestTabBarController ()

@end

@implementation TestTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.selectedIndex = 0;//默认选中第一个VC
    NSLog(@"before subViews: %@", [self.tabBar subviews]);
    //移除系统 tabBar 里面的 View
    for (UIView *view in [self.tabBar subviews]) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
        if ([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
    }
    //    NSLog(@"after subViews: %@", [self.tabBar subviews]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
