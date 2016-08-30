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
#import "LXqRegisteViewController.h"

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
        _logView = [[LXqMyLoginView alloc] initWithFrame:self.view.frame];
        __weak typeof(self) weakSelf = self;
        _logView.myViewBlock = ^(NSDictionary *userInfo){
           
            weakSelf.userInfo = userInfo;
            [weakSelf getLoginRewuest];
        };
        //免费注册
        _logView.freeRegisteBlock = ^{
            
            LXqRegisteViewController *registeVC = [[LXqRegisteViewController alloc] init];
            [weakSelf.navigationController pushViewController:registeVC animated:YES];
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
    [self createBackBtn];
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

        if ([successJson[@"ErrorMessage"] isEqualToString:@"登陆成功"]) {
            [self showToastMessage:@"登陆成功"];
            [[NSUserDefaults standardUserDefaults] setObject:successJson forKey:@"ISLOGIN"];
            [self performSelector:@selector(popMyViewController) withObject:nil afterDelay:1];
            //把参数传到tableVC
            if (_getMessageBlock) {
                _getMessageBlock(successJson);
            }
        }else if ([successJson[@"ErrorMessage"] isEqualToString:@"密码错误"]){

            [self showToastMessage:@"密码错误"];
        }else if ([successJson[@"ErrorMessage"] isEqualToString:@"用户不存在"]){
            [self showToastMessage:@"用户不存在"];
        }else{
            [self showToastMessage:@"登录失败"];
        }
        
    } error:^(NSError *error) {
        NSLog(@"登录失败%@", error);
        [self showToastMessage:@"登录失败"];
    }];
}
- (void)popMyViewController
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
