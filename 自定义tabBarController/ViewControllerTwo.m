//
//  ViewControllerTwo.m
//  自定义tabBarController
//
//  Created by lihongfeng on 16/1/6.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"

#define RandomColor [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1]

@interface ViewControllerTwo ()

@end

@implementation ViewControllerTwo{
    int _badgeValue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RandomColor;
    //refresh badgeValue
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.bounds = CGRectMake(0, 0, 130, 40);
    btn.center = CGPointMake(self.view.bounds.size.width/2, 200);
    [btn setTitle:@"refresh badge" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(refreshBadgeValue) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.tabBarItem.badgeValue = @"1";
    //push
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.bounds = CGRectMake(0, 0, 130, 40);
    pushBtn.center = CGPointMake(self.view.bounds.size.width/2, 280);
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
}

-(void)push{
    ViewControllerThree *vc = [[ViewControllerThree alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)refreshBadgeValue{
    _badgeValue++;
    if (_badgeValue == 15) {
        _badgeValue = 98;
    }
    if (_badgeValue == 102) {
        _badgeValue = 0;
    }
    
    if (_badgeValue > 0) {
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", _badgeValue];
    }else{
        self.tabBarItem.badgeValue = nil;
    }
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
