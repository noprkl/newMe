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
    [self setLeftBarItem];
    
    [self postGetCoderNumber];
    
    
}
- (LXqCheckPhoneView *)checkView
{
    if (!_checkView) {
        _checkView = [[LXqCheckPhoneView alloc] initWithFrame:self.view.bounds];
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
        NSLog(@"%@", successJson);

    } error:^(NSError *error) {
        NSLog(@"失败%@", error);

    }];
}
//得到验证码
- (void)postGetCoderNumber
{
    NSDictionary *parame = @{
                             @"MemberId":self.userInfo[@"userPhoneNumber"]
                             };
    [self postRequestWithPath:@"appMember/createCode.do" params:parame success:^(id successJson) {
        
        //重新计时
        [self.checkView timeLast];
//        if ([successJson[@"result"] isEqualToString:@"success"]) {
//            NSLog(@"%@", successJson);
//            
//        }else if ([successJson[@"result"] isEqualToString:@"TelephoneExistError"]){
//            NSLog(@"已被注册");
//        }
    } error:^(NSError *error) {
        NSLog(@"%@", error);
    }];

}
#pragma mark - 设置UIBarButtonItem
- (void)setLeftBarItem
{
    //设置返回的按钮
    UIImage *image = [UIImage imageNamed:@"详情界面返回按钮"];
    UIBarButtonItem *leftitem = [[UIBarButtonItem alloc] initWithImage:image style:(UIBarButtonItemStylePlain) target:self action:@selector(popView)];
    
    leftitem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = leftitem;

}
- (void)popView
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
