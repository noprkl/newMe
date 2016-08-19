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

- (LXqCheckPhoneView *)checkView
{
    if (!_checkView) {
        _checkView = [[LXqCheckPhoneView alloc] initWithFrame:self.view.bounds];
        _checkView.userInfo = self.userInfo;
    }
    return _checkView;;
}
- (void)setUserInfo:(NSDictionary *)userInfo
{
    _userInfo = userInfo;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证手机号";
    self.view.backgroundColor = KMaginBackGround;
    
    
    [self.view addSubview:self.checkView];

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
