//
//  LXqBaseNavigationController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqBaseNavigationController.h"

@interface LXqBaseNavigationController ()

@end

@implementation LXqBaseNavigationController
+ (void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName:[UIColor blackColor],
                                     NSFontAttributeName:[UIFont boldSystemFontOfSize:20]
                                     }];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
       
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(0, 0, 30, 30);
        [leftButton setImage:[UIImage imageNamed:@"详情界面返回按钮"] forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
        UIBarButtonItem *leftitem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        ;
        viewController.navigationItem.leftBarButtonItem = leftitem;
    }
    [super pushViewController:viewController animated:animated];

}

- (void)popView
{
    [self popViewControllerAnimated:YES];
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
