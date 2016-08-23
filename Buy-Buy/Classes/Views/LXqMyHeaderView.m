//
//  LXqMyHeaderView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqMyHeaderView.h"


@interface LXqMyHeaderView ()

/** 登录按钮 */
@property (strong, nonatomic) UIButton *loginBtn;
/** 注册按钮 */
@property (strong, nonatomic) UIButton *regisBtn;

//登录成功
///** 头像 */
//@property (strong, nonatomic) UIImageView *iconView;
///** 用户名 */
//@property (strong, nonatomic) UILabel *userNameLabel;
///** 等级 */
//@property (strong, nonatomic) UILabel *userLevelLabel;

@end

@implementation LXqMyHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"我的背景"]];
        //登录/注册按钮
        [self addSubview:self.loginBtn];
        [self addSubview:self.regisBtn];
       
         //登录成功
        
        [self addSubview:self.iconView];
        [self addSubview:self.userNameLabel];
        [self addSubview:self.userLevelLabel];
    }
    return self;
}
- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(pushLoginView) forControlEvents:UIControlEventTouchDown];
    }
    return _loginBtn;
}
- (UIButton *)regisBtn
{
    if (!_regisBtn) {
        _regisBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_regisBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_regisBtn addTarget:self action:@selector(pushRegistrView) forControlEvents:UIControlEventTouchDown];
        
    }
    return _regisBtn;
}
//登录成功
- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];

        _iconView.layer.cornerRadius = 30;
        _iconView.layer.masksToBounds = YES;
        _iconView.image = [UIImage imageNamed:@"注册界面微博登录 (2)"];
        
        _iconView.hidden = YES;
    }
    return _iconView;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.font = [UIFont systemFontOfSize:18];
        _userNameLabel.hidden = YES;
//        _userNameLabel.text = @"userNameLabel";
    }
    return _userNameLabel;
}

- (UILabel *)userLevelLabel
{
    if (!_userLevelLabel) {
        _userLevelLabel = [[UILabel alloc] init];
        _userLevelLabel.font = [UIFont systemFontOfSize:18];
        _userLevelLabel.hidden = YES;
    }
    return _userLevelLabel;
}

#pragma mark - block方法
/** 登录按钮 */
- (void)pushLoginView
{
    if (_loginBlock) {
        _loginBlock();
    }
}
/** 注册按钮 */
- (void)pushRegistrView
{
    if (_registeBlock) {
        _registeBlock();
    }
    
}
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    //未登录约束
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).offset(55);
        make.left.mas_equalTo(self.mas_left).offset(108);
        make.right.mas_equalTo(self.regisBtn.mas_left).offset(-93);
        make.height.equalTo(30);
    }];
    
    [self.regisBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(55);
        make.right.mas_equalTo(self.mas_right).offset(-108);
        make.height.equalTo(30);            //            make.left.mas_equalTo(self.loginBtn.mas_right).offset(93);
    }];
    //登录成功的约束
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(25);
        make.left.mas_equalTo(self.mas_left).offset(60);
    }];
    [self.userNameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(40);
        make.left.equalTo(self.iconView.right).offset(40);
        make.height.equalTo(20);
    }];
    [self.userLevelLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameLabel.bottom).offset(20);
        make.left.equalTo(self.iconView.right).offset(40);
        make.height.equalTo(20);
    }];
}
#pragma mark - 隐藏view
- (void)viewHiddenMedthod
{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"ISLOGIN"];
    if (isLogin.count) {
        
        self.loginBtn.hidden = YES;
        self.regisBtn.hidden = YES;
        
        self.iconView.hidden = NO;
        self.userLevelLabel.hidden = NO;
        self.userNameLabel.hidden = NO;
        self.userNameLabel.text = isLogin[@"MemberName"];
        self.userLevelLabel.text = isLogin[@"MemberLvl"];
        
    }else{
        self.loginBtn.hidden = NO;
        self.regisBtn.hidden = NO;
        
        self.iconView.hidden = YES;
        self.userLevelLabel.hidden = YES;
        self.userNameLabel.hidden = YES;
    }
}
- (void)hideView
{
    if (_reloadBock) {
        _reloadBock();
    }
}
@end
