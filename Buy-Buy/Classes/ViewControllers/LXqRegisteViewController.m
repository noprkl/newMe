//
//  LXqRegisteViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//  注册界面

#import "LXqRegisteViewController.h"
#import "LXqMyRegisetView.h"
#import "LXqCheckPhoneViewController.h"

@interface LXqRegisteViewController ()

/** 注册view */
@property (strong, nonatomic) LXqMyRegisetView *registeView;
@end

@implementation LXqRegisteViewController
- (LXqMyRegisetView *)registeView
{
    if (!_registeView) {
        _registeView = [[LXqMyRegisetView alloc] initWithFrame:self.view.bounds];
        __weak typeof(self) weakSelf = self;
        //下一步按钮
        _registeView.checkBlock= ^(NSDictionary *userInfo){
            LXqCheckPhoneViewController *checkVC = [[LXqCheckPhoneViewController alloc] init];
            checkVC.userInfo = userInfo;
            
            [weakSelf.navigationController pushViewController:checkVC animated:YES];
        };
        //新浪登录按钮
        _registeView.sinaBlock = ^{
            [weakSelf SinaLoginMethod];
        };
    }
    return _registeView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    
    [self.view addSubview:self.registeView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
