//
//  LXqMyRegisetView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//
#define kMaginColor [UIColor RGBcolorWithRed:200 green:198 blue:204 alpha:1]

#import "LXqMyRegisetView.h"

@interface LXqMyRegisetView ()<UITextFieldDelegate>

/** 提示文字框 */
@property (copy, nonatomic) UILabel *titleLabel;
/** 背景 */
@property (strong, nonatomic) UIView *backView;
/** 手机号文本框 */
@property (strong, nonatomic) UITextField *phoneText;
/** 线 */
@property (strong, nonatomic) UILabel *lineLabel;
/** 密码文本框 */
@property (strong, nonatomic) UITextField *psdText;
/** 下一步按钮 */
@property (strong, nonatomic) UIButton *nextButton;
/** 登录界面跳转按钮 */
@property (strong, nonatomic) UIButton *goLoginBtn;
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

@implementation LXqMyRegisetView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = KMaginBackGround;
        
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.backView];
        [self.backView addSubview:self.phoneText];
        [self.backView addSubview:self.lineLabel];
        [self.backView addSubview:self.psdText];
        
        [self addSubview:self.nextButton];
        [self addSubview:self.goLoginBtn];
        
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

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        NSAttributedString *mutableAttStr = [NSAttributedString attributedStringWithGrayString:@"请输入手机号码注册新用户"];
        _titleLabel.attributedText = mutableAttStr;
    }
    return _titleLabel;
}
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

- (UIButton *)nextButton/** 下一步*/
{
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        _nextButton.tintColor = [UIColor RGBcolorWithRed:145 green:145 blue:145 alpha:1];
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        _nextButton.backgroundColor = [UIColor RGBcolorWithRed:234 green:234 blue:234 alpha:1];

        //设置按钮状态
        _nextButton.userInteractionEnabled = NO;
        [_nextButton addTarget:self action:@selector(pushCheckView) forControlEvents:UIControlEventTouchDown];

    }
    return _nextButton;
}


- (UIButton *)goLoginBtn
{
    if (!_goLoginBtn) {
        _goLoginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _goLoginBtn.bounds = CGRectMake(0, 0, 17, 46);
        [_goLoginBtn setTitle:@"去登录" forState:UIControlStateNormal];
        [_goLoginBtn setTintColor:[UIColor RGBcolorWithRed:0 green:182 blue:240 alpha:1]];
        
        [_goLoginBtn addTarget:self action:@selector(pushLoginViewMedthod) forControlEvents:UIControlEventTouchDown];
    }
    return _goLoginBtn;
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
         [_qqBtn addTarget:self action:@selector(qqBtnLoginMedthod) forControlEvents:UIControlEventTouchDown];
    }
    return _qqBtn;
}
- (UIButton *)WXBtn
{
    if (!_WXBtn) {
        _WXBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _WXBtn.bounds = CGRectMake(0, 0, 45, 45);
        [_WXBtn setImage:[UIImage imageNamed:@"登录界面微信登录"] forState:UIControlStateNormal];
         [_WXBtn addTarget:self action:@selector(WXBtnLoginMedthod) forControlEvents:UIControlEventTouchDown];
    }
    return _WXBtn;
}
- (UIButton *)SinaBtn
{
    if (!_SinaBtn) {
        _SinaBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _SinaBtn.bounds = CGRectMake(0, 0, 45, 45);
        [_SinaBtn setImage:[UIImage imageNamed:@"登陆界面微博登录"] forState:UIControlStateNormal];
        [_SinaBtn addTarget:self action:@selector(sinaBtnLoginMedthod) forControlEvents:UIControlEventTouchDown];
    }
    return _SinaBtn;
}
#pragma mark - 第三方登录block
- (void)pushLoginViewMedthod
{
    if (_goLoginBlock) {
        _goLoginBlock();
    }
}
- (void)pushCheckView
{
    if (_checkBlock) {
        _checkBlock(@{@"userPhoneNumber":self.phoneText.text, @"userPsd":self.psdText.text});
    }
}
- (void)qqBtnLoginMedthod
{
    if (_qqBlock) {
        _qqBlock();
    }
}
- (void)WXBtnLoginMedthod
{
    if (_wxBlock) {
        _wxBlock();
    }
}
- (void)sinaBtnLoginMedthod
{
    if (_sinaBlock) {
        _sinaBlock();
    }
}


#pragma mark
#pragma mark - 约束

- (void)layoutSubviews{
    [super layoutSubviews];

    //这个东西写不写无所谓， 写上有风格
//    __weak typeof(self) weakself = self;

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.size.equalTo(CGSizeMake(SCREEN_SIZE.width, 35));
        make.left.equalTo(self.mas_left).offset(15);
    }];
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom);
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
    [self.nextButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView.bottom).offset(16);
        make.height.equalTo(35);
        make.left.equalTo(self.left).offset(16);
        make.right.equalTo(self.right).offset(-16);
        
    }];
    [self.goLoginBtn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(-15);
        make.top.equalTo(self.nextButton.bottom).offset(23);
    }];
    
    [self.onceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(16);
        make.centerX.equalTo(self.centerX);
        make.top.equalTo(self.nextButton.bottom).offset(58);
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
        self.nextButton.backgroundColor = [UIColor RGBcolorWithRed:56 green:166 blue:241 alpha:1];
        self.nextButton.userInteractionEnabled = YES;
    }else{
        self.nextButton.backgroundColor = [UIColor RGBcolorWithRed:234 green:234 blue:234 alpha:1];
        self.nextButton.userInteractionEnabled = NO;
    }
}
- (void)psdTextTieldChanged:(UITextField *)textField
{
    if (textField.text.length > 5 && self.phoneText.text.length == 11) {
        self.nextButton.backgroundColor = [UIColor RGBcolorWithRed:56 green:166 blue:241 alpha:1];
        self.nextButton.userInteractionEnabled = YES;
    }else{
        self.nextButton.backgroundColor = [UIColor RGBcolorWithRed:234 green:234 blue:234 alpha:1];
        self.nextButton.userInteractionEnabled = NO;
    }
}
@end
