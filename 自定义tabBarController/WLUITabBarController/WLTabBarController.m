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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //将自定义 tabBar 放入系统 tabBar 中
    WLTabBar *myTabBar = [[WLTabBar alloc] init];
    myTabBar.frame = self.tabBar.bounds;
    myTabBar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.9];
    self.customerTabBar = myTabBar;
    self.customerTabBar.delegate = self;
    self.tabBar.clipsToBounds = NO;
    [self.tabBar addSubview:self.customerTabBar];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.selectedIndex = 0;//默认选中第一个VC
//    NSLog(@"before subViews: %@", [self.tabBar subviews]);
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

-(void)addViewControllersWithVC:(UIViewController *)vc Title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    [self addViewController:vc Title:title imageName:imageName selectedImageName:selectedImageName];
}

-(void)addViewController:(UIViewController *)viewController Title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    viewController.title = title;
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
    
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
