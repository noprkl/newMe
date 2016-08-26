//
//  LXqCheckPhoneViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqCheckPhoneViewController.h"
#import "LXqCheckPhoneView.h"

@interface LXqCheckPhoneViewController ()
/** 注册View */
@property (strong, nonatomic) LXqCheckPhoneView *checkView;
@end

@implementation LXqCheckPhoneViewController


- (void)setUserInfo:(NSDictionary *)userInfo
{
    _userInfo = userInfo;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证手机号";
    self.view.backgroundColor = KMaginBackGround;
    
    [self.view addSubview:self.checkView];
    
    [self.checkView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self postGetCoderNumber];
    
    [self createBackBtn];
    
}
- (LXqCheckPhoneView *)checkView
{
    if (!_checkView) {
        _checkView = [[LXqCheckPhoneView alloc] initWithFrame:self.view.frame];
        _checkView.userInfo = self.userInfo;
        __weak typeof(self) weakSelf = self;
        //重新获得验证码
        _checkView.coderBlock = ^(){
            [weakSelf postGetCoderNumber];
        };
        //注册
        _checkView.registeBlock = ^(NSString *coderNumber){
            [weakSelf getRegisteRequest:coderNumber];
        
        };
    }
    return _checkView;;
}
#pragma mark - 网络请求
//得到验证码
- (void)postGetCoderNumber
{
    NSDictionary *parame = @{
                             @"MemberId":self.userInfo[@"userPhoneNumber"]
                             };
    [self postRequestWithPath:@"appMember/createCode.do" params:parame success:^(id successJson) {
        
        //重新计时
        [self.checkView timeLast];
        
    } error:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}
//注册请求
- (void)getRegisteRequest:(NSString *)coderNumber
{
    /**
     http://123.57.141.249:8080/beautalk/appMember/appRegistraZon.do
     
     传入数据:  
     手机号:LoginName
     密 码:Lpassword
     验证码:Code
     手机号:Telephone
     
     */
    
    NSDictionary *parame = @{
                             @"LoginName":self.userInfo[@"userPhoneNumber"],
                             @"Lpassword":self.userInfo[@"userPsd"],
                             @"Code":coderNumber,
                             @"Telephone":self.userInfo[@"userPhoneNumber"]
                             };
    
    [self getRequestWithPath:@"appMember/appRegistration.do" params:parame success:^(id successJson) {
        if ([successJson[@"result"] isEqualToString:@"success"]) {
            [self autoLoginMethod];
        }else if ([successJson[@"result"] isEqualToString:@"coderError"]){

            [self showToastMessage:@"验证码错误"];
        }else{
            NSLog(@"注册失败");
            [self showToastMessage:@"注册失败"];
        }

    } error:^(NSError *error) {
        NSLog(@"登录失败%@", error);
            [self showToastMessage:@"登录失败"];
    }];
}
#pragma mark - 自动登录
- (void)autoLoginMethod
{
    NSDictionary *parame = @{
                             @"LoginName":self.userInfo[@"userPhoneNumber"],
                             @"Lpassword":self.userInfo[@"userPsd"]
                             };
    
    [self getRequestWithPath:@"appMember/appLogin.do" params:parame success:^(id successJson) {
        
        if ([successJson[@"result"] isEqualToString:@"0"]) {
                        [self showToastMessage:@"登录成功"];
            [[NSUserDefaults standardUserDefaults] setObject:successJson forKey:@"ISLOGIN"];
            
            [self performSelector:@selector(popMyViewController) withObject:nil afterDelay:1];
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
#pragma mark - 设置UIBarButtonItem


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
