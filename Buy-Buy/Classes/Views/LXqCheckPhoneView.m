//
//  LXqCheckPhoneView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//
#define LASTTIME 10

#import "LXqCheckPhoneView.h"


@interface LXqCheckPhoneView ()<UITextFieldDelegate>

/** 提示的label */
@property (strong, nonatomic) UILabel *titleLabel;
/** 背景 */
@property (strong, nonatomic) UIView *backView;
/** 验证码文本框 */
@property (strong, nonatomic) UITextField *codeText;
/** 倒计时按钮 */
@property (strong, nonatomic) UIButton *timeBtn;
/** 竖着的线 */
@property (strong, nonatomic) UILabel *linLabel;
/** 注册按钮 */
@property (strong, nonatomic) UIButton *registeBtn;
/** 重新发送按钮 */
@property (strong, nonatomic) UIButton *resendBtn;

@end

@implementation LXqCheckPhoneView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.backView];
        [self.backView addSubview:self.codeText];
        
        [self.codeText addSubview:self.timeBtn];
        [self.codeText addSubview:self.linLabel];
        [self addSubview:self.registeBtn];
        [self addSubview:self.resendBtn];
        
     
        [self timeLast];
    }
    return self;
}
#pragma mark - set方法
- (void)setUserInfo:(NSDictionary *)userInfo
{
    _userInfo = userInfo;
    
    NSString *string = [NSString stringWithFormat:@"+86 %@", userInfo[@"userPhoneNumber"]];
    NSAttributedString *attribute = [NSAttributedString attributedStringWithString:@"验证码已发送 " string:string];
    self.titleLabel.attributedText = attribute;;
}
#pragma mark
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.size.equalTo(CGSizeMake(SCREEN_SIZE.width, 35));
        make.left.equalTo(self.mas_left).offset(15);
        make.height.equalTo(30);
    }];
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.right);
        make.height.equalTo(44);
    }];
    [self.codeText makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView.top);
        make.left.equalTo(self.backView.left).offset(15);
        make.right.equalTo(self.backView.right);
        make.height.equalTo(44);
    }];
    [self.linLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.codeText.right).offset(-105);
        make.top.equalTo(self.codeText.top).offset(5);
        make.bottom.equalTo(self.codeText.bottom).offset(-5);
        make.width.equalTo(1);
    }];
    [self.timeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.codeText.centerY);
        make.top.equalTo(self.codeText.top).offset(10);
        make.left.equalTo(self.linLabel.left).offset(10);
    }];

    [self.registeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView.bottom).offset(16);
        make.height.equalTo(35);
        make.left.equalTo(self.left).offset(16);
        make.right.equalTo(self.right).offset(-16);
    }];
    [self.resendBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.registeBtn.bottom).offset(22);
        make.height.equalTo(35);
        make.centerX.equalTo(self.centerX);
        make.left.equalTo(self.left).offset(16);
        make.right.equalTo(self.right).offset(-16);
    }];
    
}
#pragma mark
#pragma mark - 懒加载
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        NSDictionary *dict1 = @{
                                NSForegroundColorAttributeName:[UIColor grayColor]
                                };
        
        NSMutableAttributedString *mutableAttStr1 = [[NSMutableAttributedString alloc] initWithString:@"验证码已发送 " attributes:dict1];
        _titleLabel.attributedText = mutableAttStr1;
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
- (UITextField *)codeText
{
    if (!_codeText) {
        _codeText = [[UITextField alloc] init];
        _codeText.placeholder = @"请输入验证码";
        _codeText.backgroundColor = [UIColor whiteColor];
        [_codeText addTarget:self action:@selector(coderNumberTextTieldChanged:) forControlEvents:UIControlEventAllEditingEvents];
    }
    return _codeText;
}
- (UIButton *)timeBtn
{
    if (!_timeBtn) {
        _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
             _timeBtn.userInteractionEnabled = NO;
        [_timeBtn addTarget:self action:@selector(getCoderNumber) forControlEvents:UIControlEventTouchDown];
        
    }
    return _timeBtn;
}
- (UILabel *)linLabel
{

    if (!_linLabel) {
        _linLabel = [[UILabel alloc] init];
        _linLabel.backgroundColor = KMLineColor;
    }
    return _linLabel;
}

- (UIButton *)registeBtn
{
    if (!_registeBtn) {
        _registeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        _registeBtn.tintColor = [UIColor RGBcolorWithRed:145 green:145 blue:145 alpha:1];
        [_registeBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registeBtn.backgroundColor = [UIColor RGBcolorWithRed:234 green:234 blue:234 alpha:1];
        
        //圆角
        _registeBtn.layer.cornerRadius = 3;
        _registeBtn.layer.masksToBounds = YES;
        
        //点击方法
        self.registeBtn.userInteractionEnabled = NO;
        [_registeBtn addTarget:self action:@selector(registeBtnMethod) forControlEvents:UIControlEventTouchDown];
    }
    return _registeBtn;

}
- (UIButton *)resendBtn
{
    if (!_resendBtn) {
        _resendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_resendBtn setTitle:@"重新发送验证码" forState:UIControlStateNormal];
        _resendBtn.tintColor = [UIColor RGBcolorWithRed:145 green:145 blue:145 alpha:1];
        [_resendBtn addTarget:self action:@selector(getCoderNumber) forControlEvents:UIControlEventTouchDown];
    }
    return _resendBtn;
}
#pragma mark - 验证码文本框监听
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.codeText && range.location == 6) {
        return NO;
    }
    return YES;
}
- (void)coderNumberTextTieldChanged:(UITextField *)textField
{
    if (textField.text.length == 6) {
        self.registeBtn.userInteractionEnabled = YES;
        self.registeBtn.backgroundColor = [UIColor RGBcolorWithRed:56 green:166 blue:241 alpha:1];
    }else{
        self.registeBtn.userInteractionEnabled = NO;
        self.registeBtn.backgroundColor = [UIColor RGBcolorWithRed:234 green:234 blue:234 alpha:1];
    }
}
#pragma mark - 注册block
- (void)registeBtnMethod
{
    if (_registeBlock) {
        _registeBlock(self.codeText.text);
    }
}
#pragma mark - 重新请求block
- (void)getCoderNumber
{
    if (_coderBlock) {
        _coderBlock();
    }
}
#pragma mark - 倒计时定时器
- (void)timeLast
{
    
    __block NSInteger time = LASTTIME;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        
        if (time <= 1) {
            //取消计时
            dispatch_source_cancel(timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.timeBtn.userInteractionEnabled = YES;
                NSAttributedString *attribute = [NSAttributedString attributedStringWithString:@"获取验证码"];
                [self.timeBtn setAttributedTitle:attribute forState:UIControlStateNormal];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                self.timeBtn.userInteractionEnabled = NO;
                
                NSAttributedString *attribute = [NSAttributedString attributedStringWithNumber:time  string:@"秒后重试"];
                [self.timeBtn setAttributedTitle:attribute forState:UIControlStateNormal];
            });
            time --;
        }
        
        
    });
    dispatch_resume(timer);
    
}

@end
