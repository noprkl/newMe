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
/** 登录信息 */
@property (strong, nonatomic) NSDictionary *userInfo;
@end

@implementation LXqLoginViewController
- (NSDictionary *)userInfo
{
    if (!_userInfo) {
        _userInfo = [NSDictionary dictionary];
    }
    return _userInfo;
}
- (LXqMyLoginView *)logView
{
    if (!_logView) {
        _logView = [[LXqMyLoginView alloc] initWithFrame:self.view.bounds];
        __weak typeof(self) weakSelf = self;
        _logView.myViewBlock = ^(NSDictionary *userInfo){
            LXqMyViewController *myVC = [[LXqMyViewController alloc] init];
            [weakSelf.navigationController pushViewController:myVC animated:YES];
            weakSelf.userInfo = userInfo;
            [weakSelf getLoginRewuest];
        };
        //QQ登录
        _logView.qqBlock = ^{
            [weakSelf QQLoginMethod];
        };
        //微信登录
        _logView.wxBlock = ^{
            [weakSelf WXLoginMethod];
        };
        //新浪登录按钮
        _logView.sinaBlock = ^{
            [weakSelf SinaLoginMethod];
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
/** 登录请求 */
- (void)getLoginRewuest
{
    /**
     登陆名:LoginName
     密码 :Lpassword
     优惠券ID:CouponsId 【可不填】
     */
    NSDictionary *parame = @{
                             @"LoginName":self.userInfo[@"userPhoneNumber"],
                             @"Lpassword":self.userInfo[@"userPsd"]
                             };
    [self getRequestWithPath:@"appMember/appLogin.do" params:parame success:^(id successJson) {
        NSLog(@"登录成功%@", successJson);
    } error:^(NSError *error) {
        NSLog(@"登录失败%@", error);
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
