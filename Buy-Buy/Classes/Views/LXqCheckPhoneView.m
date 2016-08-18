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
/** <#注释#> */
@property (strong, nonatomic) UILabel *backLabel;
/** <#注释#> */
@property (strong, nonatomic) UITextField *codeText;
/** <#注释#> */
@property (strong, nonatomic) UIButton *timeBtn;
/** <#注释#> */
@property (strong, nonatomic) UILabel *linLabel;
/** <#注释#> */
@property (strong, nonatomic) UIButton *registeBtn;
/** <#注释#> */
@property (strong, nonatomic) UIButton *resendBtn;

@end

@implementation LXqCheckPhoneView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.backLabel];
        [self addSubview:self.codeText];
        [self addSubview:self.timeBtn];
        [self addSubview:self.linLabel];
        [self addSubview:self.registeBtn];
        [self addSubview:self.resendBtn];
    }
    return self;
}
#pragma mark
#pragma mark - 懒加载
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"验证码已发送 +86";
    }
    return _titleLabel;
}
- (UILabel *)backLabel
{
    if (!_backLabel) {
        _backLabel = [[UILabel alloc] init];
    }
    return _backLabel;
}
- (UITextField *)codeText
{
    if (!_codeText) {
        _codeText = [[UITextField alloc] init];
    }
    return _codeText;
}

@end
