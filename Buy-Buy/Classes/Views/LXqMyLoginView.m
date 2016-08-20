//
//  LXqMyLoginView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 LXq. All rights reserved.
//  登录view

#define kMaginColor [UIColor RGBcolorWithRed:200 green:198 blue:204 alpha:1]

#import "LXqMyLoginView.h"


@interface LXqMyLoginView ()<UITextFieldDelegate>

/** 背景 */
@property (strong, nonatomic) UIView *backView;
/** 手机号文本框 */
@property (strong, nonatomic) UITextField *phoneText;
/** 线 */
@property (strong, nonatomic) UILabel *lineLabel;
/** 密码文本框 */
@property (strong, nonatomic) UITextField *psdText;
/** 登录 */
@property (strong, nonatomic) UIButton *LoginBtn;
/** 注册界面跳转按钮 */
@property (strong, nonatomic) UIButton *freeRegiste;
/** 左分割线label */
@property (strong, nonatomic) UILabel *leftLabel;
/** 右分割线label */
@property (strong, nonatomic) UILabel *rightLabel;
/** 一键登录提示 */
@property (strong, nonatomic) UILabel *onceLabel;
/** 第三方登录按钮 */
@property (strong, nonatomic) UIButton *qqBtn;
@property (strong, nonatomic) UIButton *WXBtn;
@property (strong, nonatomic) UIButton *SinaBtn;

@end

@implementation LXqMyLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = KMaginBackGround;
        
        [self addSubview:self.backView];
        [self.backView addSubview:self.phoneText];
        [self.backView addSubview:self.lineLabel];
        [self.backView addSubview:self.psdText];
       
        [self addSubview:self.LoginBtn];
        [self addSubview:self.freeRegiste];
        
        [self addSubview:self.leftLabel];
        [self addSubview:self.onceLabel];
        [self addSubview:self.rightLabel];
        [self addSubview:self.WXBtn];
        [self addSubview:self.qqBtn];
        [self addSubview:self.SinaBtn];
    }
    return self;
}

#pragma mark
#pragma mark - 懒加载

- (UIView *)backView
{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.borderWidth = 1;
        _backView.layer.borderColor = KMLineColor.CGColor;
    }
    return _backView;
}
- (UITextField *)phoneText
{
    if (!_phoneText) {
        _phoneText = [[UITextField alloc] init];
        _phoneText.placeholder = @"请输入手机号码";
        _phoneText.backgroundColor = [UIColor whiteColor];
        _phoneText.delegate = self;
        [_phoneText addTarget:self action:@selector(phoneTextTieldChanged:) forControlEvents:UIControlEventAllEditingEvents];
    }
    return _phoneText;
}
- (UILabel *)lineLabel
{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = KMLineColor;
    }
    return _lineLabel;
}
- (UITextField *)psdText
{
    if (!_psdText) {
        _psdText = [[UITextField alloc] init];
        _psdText.placeholder = @"设置账号密码";
        _psdText.delegate = self;
        _psdText.backgroundColor = [UIColor whiteColor];
        [_psdText addTarget:self action:@selector(psdTextTieldChanged:) forControlEvents:UIControlEventAllEditingEvents];
    }
    return _psdText;
}

#pragma mark - nextBtn按钮
- (UIButton *)LoginBtn
{
    if (!_LoginBtn) {
        _LoginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _LoginBtn.tintColor = [UIColor RGBcolorWithRed:145 green:145 blue:145 alpha:1];
        [_LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _LoginBtn.backgroundColor = [UIColor RGBcolorWithRed:234 green:234 blue:234 alpha:1];
        
        //设置按钮状态
        _LoginBtn.userInteractionEnabled = NO;
        [_LoginBtn addTarget:self action:@selector(pushMyView) forControlEvents:UIControlEventTouchDown];
        
    }
    return _LoginBtn;
}

- (void)pushMyView
{
    if (_myViewBlock) {
        _myViewBlock();
    }
}
- (UIButton *)freeRegiste
{
    if (!_freeRegiste) {
        _freeRegiste = [UIButton buttonWithType:UIButtonTypeSystem];
        _freeRegiste.bounds = CGRectMake(0, 0, 17, 46);
        [_freeRegiste setTitle:@"免费注册" forState:UIControlStateNormal];
        [_freeRegiste setTintColor:[UIColor RGBcolorWithRed:0 green:182 blue:240 alpha:1]];
    }
    return _freeRegiste;
}
- (UILabel *)onceLabel
{
    if (!_onceLabel) {
        _onceLabel = [[UILabel alloc] init];
        _onceLabel.text = @"一键登录";
        _onceLabel.textAlignment = NSTextAlignmentCenter;
        _onceLabel.font = [UIFont systemFontOfSize:16];
        _onceLabel.numberOfLines = 1;
        _onceLabel.tintColor = [UIColor purpleColor];
    }
    return _onceLabel;
}
- (UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.backgroundColor = [UIColor grayColor];
    }
    return _leftLabel;
}
- (UILabel *)rightLabel
{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.backgroundColor = [UIColor RGBcolorWithRed:145 green:145 blue:145 alpha:1];
    }
    return _rightLabel;
}
- (UIButton *)qqBtn
{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _qqBtn.bounds = CGRectMake(0, 0, 45, 45);
        [_qqBtn setImage:[UIImage imageNamed:@"登录界面qq登陆"] forState:UIControlStateNormal];
    }
    return _qqBtn;
}
- (UIButton *)WXBtn
{
    if (!_WXBtn) {
        _WXBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _WXBtn.bounds = CGRectMake(0, 0, 45, 45);
        [_WXBtn setImage:[UIImage imageNamed:@"登录界面微信登录"] forState:UIControlStateNormal];
    }
    return _WXBtn;
}
- (UIButton *)SinaBtn
{
    if (!_SinaBtn) {
        _SinaBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _SinaBtn.bounds = CGRectMake(0, 0, 45, 45);
        [_SinaBtn setImage:[UIImage imageNamed:@"登陆界面微博登录"] forState:UIControlStateNormal];
    }
    return _SinaBtn;
}


#pragma mark
#pragma mark - 约束

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //这个东西写不写无所谓， 写上有风格
    //    __weak typeof(self) weakself = self;
  
       [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(64);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.right);
        make.height.equalTo(89);
    }];
    
    [self.phoneText makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView.top);
        make.left.equalTo(self.backView.left).offset(15);
        make.right.equalTo(self.backView.right);
        make.height.equalTo(44);
    }];
    [self.lineLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneText.bottom);
        make.left.equalTo(self.backView.left).offset(15);
        make.right.equalTo(self.backView.right).offset(-15);
        make.height.equalTo(1);
    }];
    [self.psdText makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineLabel.bottom);
        make.left.equalTo(self.backView.left).offset(15);
        make.right.equalTo(self.backView.right);
        make.height.equalTo(44);
    }];
    [self.LoginBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView.bottom).offset(16);
        make.height.equalTo(35);
        make.left.equalTo(self.left).offset(16);
        make.right.equalTo(self.right).offset(-16);
        
    }];
    [self.freeRegiste makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(-15);
        make.top.equalTo(self.LoginBtn.bottom).offset(23);
    }];
    
    [self.onceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(16);
        make.centerX.equalTo(self.centerX);
        make.top.equalTo(self.LoginBtn.bottom).offset(58);
    }];
    [self.leftLabel makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(0.5);
        make.centerY.equalTo(self.onceLabel.centerY);
        make.left.equalTo(self.left).offset(16);
        make.right.equalTo(self.onceLabel.left).offset(-16);
    }];
    [self.rightLabel makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(0.5);
        make.centerY.equalTo(self.onceLabel.centerY);
        make.left.equalTo(self.onceLabel.right).offset(16);
        make.right.equalTo(self.right).offset(-16);
    }];
    [self.WXBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.centerX);
        make.top.equalTo(self.onceLabel.bottom).offset(20);
    }];
    [self.qqBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.WXBtn.centerY);
        make.right.equalTo(self.WXBtn.left).offset(-61);
    }];
    
    [self.SinaBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.WXBtn.centerY);
        make.left.equalTo(self.WXBtn.right).offset(61);
    }];
    
}
#pragma mark
#pragma mark - textFiled代理
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.phoneText && range.location == 11) {
        return NO;
    }
    return YES;
}
#pragma mark - 文本内容监听
- (void)phoneTextTieldChanged:(UITextField *)textField
{
    if (textField.text.length == 11 && self.psdText.text.length > 5) {
        self.LoginBtn.backgroundColor = [UIColor RGBcolorWithRed:56 green:166 blue:241 alpha:1];
        self.LoginBtn.userInteractionEnabled = YES;
    }else{
        self.LoginBtn.backgroundColor = [UIColor RGBcolorWithRed:234 green:234 blue:234 alpha:1];
        self.LoginBtn.userInteractionEnabled = NO;
    }
}
- (void)psdTextTieldChanged:(UITextField *)textField
{
    if (textField.text.length > 5 && self.phoneText.text.length == 11) {
        self.LoginBtn.backgroundColor = [UIColor RGBcolorWithRed:56 green:166 blue:241 alpha:1];
        self.LoginBtn.userInteractionEnabled = YES;
    }else{
        self.LoginBtn.backgroundColor = [UIColor RGBcolorWithRed:234 green:234 blue:234 alpha:1];
        self.LoginBtn.userInteractionEnabled = NO;
    }
}
@end

