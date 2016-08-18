//
//  LXqCheckPhoneView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqCheckPhoneView.h"


@interface LXqCheckPhoneView ()
/** 提示的label */
@property (strong, nonatomic) UILabel *titleLabel;
/** 线1 */
@property (strong, nonatomic) UILabel *backLabel;
/** 验证码文本框 */
@property (strong, nonatomic) UITextField *codeText;
/** 倒计时按钮 */
@property (strong, nonatomic) UIButton *timeBtn;
/** 竖着的线 */
@property (strong, nonatomic) UILabel *linLabel;
/** 线2 */
@property (strong, nonatomic) UILabel *baclLabel2;
/** 注册按钮 */
@property (strong, nonatomic) UIButton *registeBtn;
/** 重新发送按钮 */
@property (strong, nonatomic) UIButton *resendBtn;

/** 倒计时数 */
@property (assign, nonatomic) NSInteger lasttime;
/** 定时器 */
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation LXqCheckPhoneView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.backLabel];
        [self addSubview:self.codeText];
        
        [self.codeText addSubview:self.timeBtn];
        [self.codeText addSubview:self.linLabel];
        [self addSubview:self.baclLabel2];
        [self addSubview:self.registeBtn];
        [self addSubview:self.resendBtn];
        
        self.lasttime = 60;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeLast) userInfo:nil repeats:YES];
     
    }
    return self;
}
#pragma mark - 倒计时定时器
- (void)timeLast
{
    self.lasttime -= 1;

    if (self.lasttime == 0) {
//        [self.timer invalidate];
//        self.timer = nil;
        self.lasttime = 60;
    }
    NSString *string = [NSString stringWithFormat:@"%0.2ld秒后重试",self.lasttime];
    NSMutableAttributedString *mutableAttStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSDictionary *dict1 = @{
                            NSForegroundColorAttributeName:[UIColor RGBcolorWithRed:0 green:183 blue:240 alpha:1],
                            NSFontAttributeName:[UIFont systemFontOfSize:15]
                            };
    NSRange range1 = NSMakeRange(0, 2);
    [mutableAttStr addAttributes:dict1 range:range1];
    NSDictionary *dict2 = @{
                            NSForegroundColorAttributeName:[UIColor grayColor],
                            NSFontAttributeName:[UIFont systemFontOfSize:15]
                            };
    NSRange range2 = NSMakeRange(2, 4);
    [mutableAttStr addAttributes:dict2 range:range2];
    
    [self.timeBtn setAttributedTitle:mutableAttStr forState:UIControlStateNormal];

}

#pragma mark
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(64);
        make.size.equalTo(CGSizeMake(SCREEN_SIZE.width, 35));
        make.left.equalTo(self.mas_left).offset(15);
    }];
    [self.backLabel makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(1);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.top.equalTo(self.titleLabel.bottom);
    }];
    [self.codeText makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backLabel.bottom).offset(0);
        make.size.equalTo(CGSizeMake(SCREEN_SIZE.width, 44));
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
        make.right.equalTo(self.right).offset(-10);
    }];
    [self.baclLabel2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeText.bottom);
        make.size.equalTo(CGSizeMake(SCREEN_SIZE.width, 1));
        make.left.equalTo(self.left);

    }];
    
    [self.registeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baclLabel2.bottom).offset(16);
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
        NSString *string = @"验证码已发送 +86";
        NSMutableAttributedString *mutableAttStr = [[NSMutableAttributedString alloc] initWithString:string];
        NSDictionary *dict1 = @{
                                NSForegroundColorAttributeName:[UIColor grayColor],
                                NSFontAttributeName:[UIFont systemFontOfSize:15]
                                };
        NSRange range1 = NSMakeRange(0, 6);
        [mutableAttStr addAttributes:dict1 range:range1];
        NSDictionary *dict2 = @{
                                NSForegroundColorAttributeName:[UIColor RGBcolorWithRed:0 green:183 blue:240 alpha:1],
                                NSFontAttributeName:[UIFont systemFontOfSize:15]
                                };
        NSRange range2 = NSMakeRange(7, 3);
        [mutableAttStr addAttributes:dict2 range:range2];
       
        _titleLabel.attributedText = mutableAttStr;


    }
    return _titleLabel;
}
- (UILabel *)backLabel
{
    if (!_backLabel) {
        _backLabel = [[UILabel alloc] init];
        _backLabel.backgroundColor = KMLineColor;
    }
    return _backLabel;
}
- (UITextField *)codeText
{
    if (!_codeText) {
        _codeText = [[UITextField alloc] init];
        _codeText.placeholder = @"   请输入验证码";
        _codeText.backgroundColor = [UIColor whiteColor];
    }
    return _codeText;
}
- (UIButton *)timeBtn
{
    if (!_timeBtn) {
        _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置倒数的颜色

        NSMutableAttributedString *mutableAttStr = [[NSMutableAttributedString alloc] initWithString:@"60秒后重试"];
        NSDictionary *dict1 = @{
                                NSForegroundColorAttributeName:[UIColor RGBcolorWithRed:0 green:183 blue:240 alpha:1],
                                NSFontAttributeName:[UIFont systemFontOfSize:15]
                               };
        NSRange range1 = NSMakeRange(0, 2);
        [mutableAttStr addAttributes:dict1 range:range1];
        NSDictionary *dict2 = @{
                                NSForegroundColorAttributeName:[UIColor grayColor],
                                NSFontAttributeName:[UIFont systemFontOfSize:15]
                                };
        NSRange range2 = NSMakeRange(2, 4);
        [mutableAttStr addAttributes:dict2 range:range2];
        
        [_timeBtn setAttributedTitle:mutableAttStr forState:UIControlStateNormal];
//        [_timeBtn setTitle:@"60秒后重试" forState:UIControlStateNormal];
//        _timeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
//
        
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
- (UILabel *)baclLabel2
{
    if (!_baclLabel2) {
        _baclLabel2 = [[UILabel alloc] init];
        _baclLabel2.backgroundColor = KMLineColor;
    }
    return _baclLabel2;
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
    }
    return _registeBtn;

}
- (UIButton *)resendBtn
{
    if (!_resendBtn) {
        _resendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_resendBtn setTitle:@"重新发送验证码" forState:UIControlStateNormal];
        _resendBtn.tintColor = [UIColor RGBcolorWithRed:145 green:145 blue:145 alpha:1];

    }
    return _resendBtn;
}

@end
