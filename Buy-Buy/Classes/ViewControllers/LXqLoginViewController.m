//
//  LXqLoginViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
// 登录

#import "LXqLoginViewController.h"
#import "LXqMyLoginView.h"
#import "LXqMyViewController.h"

@interface LXqLoginViewController ()

/** 登录View */
@property (strong, nonatomic) LXqMyLoginView *logView;

@end

@implementation LXqLoginViewController
- (LXqMyLoginView *)logView
{
    if (!_logView) {
        _logView = [[LXqMyLoginView alloc] initWithFrame:self.view.bounds];
        __weak typeof(self) weakSelf = self;
        _logView.myViewBlock = ^(){
            LXqMyViewController *myVC = [[LXqMyViewController alloc] init];
            [weakSelf.navigationController pushViewController:myVC animated:YES];
        };
    }
    return _logView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
    [self.view addSubview:self.logView];
    self.hidesBottomBarWhenPushed = YES;
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
