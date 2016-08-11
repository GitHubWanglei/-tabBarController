//
//  WLTabBarController.m
//
//  Created by wanglei on 15/10/14.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import "WLTabBarController.h"
#import "WLTabBar.h"

@interface WLTabBarController ()<WLTabBarDelegate>
@property (nonatomic, strong) WLTabBar *customerTabBar;
@end

@implementation WLTabBarController

#pragma mark - lifecycle
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //remove subviews form system tabBar
    if (self.tabBar.subviews) {
        for (UIView *view in [self.tabBar subviews]) {
            if ([view isKindOfClass:[UIControl class]]) {
                [view removeFromSuperview];
            }
            if ([view isKindOfClass:[UIImageView class]]) {
                [view removeFromSuperview];
            }
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.clipsToBounds = NO;
    [self.tabBar addSubview:self.customerTabBar];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.selectedIndex = 0;
}

#pragma mark - addChildViewController
-(void)addChildViewController:(UIViewController *)viewController
                        Title:(NSString *)title
                    imageName:(NSString *)imageName
            selectedImageName:(NSString *)selectedImageName{
    viewController.title = title;
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    [self addChildViewController:viewController];
    [self.customerTabBar addButtonWithItem:viewController.tabBarItem];
}

#pragma mark - WLTabBarDelegate
-(void)changViewControllerFrom:(NSInteger)lastIndex to:(NSInteger)currentIndex{
    self.selectedIndex = currentIndex;
#ifdef DEBUG
    NSLog(@"from  %ld  to  %ld", (long)lastIndex, (long)currentIndex);
#endif
}

-(void)clickAddButton{
    UIView *v = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    v.backgroundColor = [UIColor colorWithRed:0.3 green:0.8 blue:0.2 alpha:0.85];
    v.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2*3);
    [self.view addSubview:v];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
    [v addGestureRecognizer:tapGesture];
    v.userInteractionEnabled = YES;
    
    [UIView animateWithDuration:1/3.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        v.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    } completion:^(BOOL finished) {
        
    }];
}

-(void)dismiss:(UIGestureRecognizer *)gesture{
    [UIView animateWithDuration:1/3.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        gesture.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2*3);
    } completion:^(BOOL finished) {
    }];
}

- (WLTabBar *)customerTabBar{
    if (!_customerTabBar) {
        _customerTabBar = [[WLTabBar alloc] init];
        _customerTabBar.frame = self.tabBar.bounds;
        _customerTabBar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        self.customerTabBar.delegate = self;
    }
    return _customerTabBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
