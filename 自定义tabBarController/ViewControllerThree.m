//
//  ViewControllerThree.m
//  自定义tabBarController
//
//  Created by lihongfeng on 16/1/6.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewControllerThree.h"
#import "ViewControllerFour.h"

@interface ViewControllerThree ()

@end

@implementation ViewControllerThree

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
    //push
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.bounds = CGRectMake(0, 0, 130, 40);
    pushBtn.center = CGPointMake(self.view.bounds.size.width/2, 200);
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
}

-(void)push{
    ViewControllerFour *vc = [[ViewControllerFour alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
