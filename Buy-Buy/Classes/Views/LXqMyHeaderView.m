//
//  LXqMyHeaderView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqMyHeaderView.h"
#import <Masonry.h>

@interface LXqMyHeaderView ()

/** 登录按钮 */
@property (strong, nonatomic) UIButton *loginBtn;
/** 注册按钮 */
@property (strong, nonatomic) UIButton *regisBtn;

@end

@implementation LXqMyHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"我的背景"]];
        //登录/注册按钮
        [self addSubview:self.loginBtn];
        [self addSubview:self.regisBtn];
        //添加约束
        [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(self.mas_top).offset(110);
            make.left.mas_equalTo(self.mas_left).offset(108);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-55);
            make.right.mas_equalTo(self.regisBtn.mas_left).offset(-93);
        }];
        
        [self.regisBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(110);
            make.right.mas_equalTo(self.mas_right).offset(-108);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-55);
            //            make.left.mas_equalTo(self.loginBtn.mas_right).offset(93);
        }];

    }
    return self;
}
- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        
    }
    return _loginBtn;
}
- (UIButton *)regisBtn
{
    if (!_regisBtn) {
        _regisBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_regisBtn setTitle:@"注册" forState:UIControlStateNormal];
        
        
    }
    return _regisBtn;
}


@end
