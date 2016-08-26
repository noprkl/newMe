//
//  LXqClassGoodsHeaderView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//

#define kLineSelectColor [UIColor RGBcolorWithRed:0 green:183 blue:240 alpha:1]
#define KlineNormalColor  [UIColor whiteColor]

#import "LXqClassGoodsHeaderView.h"

@interface LXqClassGoodsHeaderView ()
/** 热门button */
@property (strong, nonatomic) UIButton *hostBtn;
/** 线1 */
@property (strong, nonatomic) UILabel *hostLine;

/** 价格button */
@property (strong, nonatomic) UIButton *priceBtn;
/** 线2 */
@property (strong, nonatomic) UILabel *priceLine;

/** 好评button */
@property (strong, nonatomic) UIButton *scoreBtn;
/** 线3 */
@property (strong, nonatomic) UILabel *scoreLine;
/** 新品button */
@property (strong, nonatomic) UIButton *timeBtn;
/** 线4 */
@property (strong, nonatomic) UILabel *timeLine;
@end
@implementation LXqClassGoodsHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.hostBtn];
        [self.hostBtn addSubview:self.hostLine];
        
        [self addSubview:self.priceBtn];
        [self.priceBtn addSubview:self.priceLine];
        
        [self addSubview:self.scoreBtn];
        [self.scoreBtn addSubview:self.scoreLine];
        
        [self addSubview:self.timeBtn];
        [self.timeBtn addSubview:self.timeLine];
        
    }
    return self;
}
#pragma mark
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.hostBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.height.equalTo(self.height);
        make.left.equalTo(self.left).offset(40);
    }];
    [self.hostLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.hostBtn.bottom);
        make.left.equalTo(self.hostBtn.left);
        make.right.equalTo(self.hostBtn.right);
        make.height.equalTo(1);
    }];
    
    [self.priceBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.height.equalTo(self.height);
        make.left.equalTo(self.hostBtn.right).offset(50);
    }];
    [self.priceLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.priceBtn.bottom);
        make.left.equalTo(self.priceBtn.left);
        make.right.equalTo(self.priceBtn.right);
        make.height.equalTo(1);
    }];
    
    [self.scoreBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.height.equalTo(self.height);
        make.right.equalTo(self.timeLine.left).offset(-50);
    }];
    [self.scoreLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.scoreBtn.bottom);
        make.left.equalTo(self.scoreBtn.left);
        make.right.equalTo(self.scoreBtn.right);
        make.height.equalTo(1);
    }];
    
    [self.timeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.height.equalTo(44);
        make.right.equalTo(self.right).offset(-30);
    }];
    [self.timeLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.timeBtn.bottom);
        make.left.equalTo(self.timeBtn.left);
        make.right.equalTo(self.timeBtn.right);
        make.height.equalTo(1);
    }];
    
    
}
#pragma mark
#pragma mark - 点击事件
- (void)hostBtnTouchAction
{
    if (_hostBtnBlock) {
        BOOL select = _hostBtnBlock();
        if (select) {
            self.hostBtn.selected = YES;
            self.hostLine.backgroundColor = kLineSelectColor;
            self.priceBtn.selected = NO;
            self.priceLine.backgroundColor = KlineNormalColor;
            self.scoreBtn.selected = NO;
            self.scoreLine.backgroundColor = KlineNormalColor;
            self.timeBtn.selected = NO;
            self.timeLine.backgroundColor = KlineNormalColor;
        }
    }
}
- (void)priceBtnTouchAction
{
    if (_priceBtnBlock) {
        BOOL select = _priceBtnBlock();
        if (select) {
            self.hostBtn.selected = NO;
            self.hostLine.backgroundColor = KlineNormalColor;
            self.priceBtn.selected = YES;
            self.priceLine.backgroundColor = kLineSelectColor;
            self.scoreBtn.selected = NO;
            self.scoreLine.backgroundColor = KlineNormalColor;
            self.timeBtn.selected = NO;
            self.timeLine.backgroundColor = KlineNormalColor;
        }
    }
}
- (void)scoreBtnTouchAction
{
    if (_scoreBtnBlock) {
        BOOL select = _scoreBtnBlock();
        if (select) {
            self.hostBtn.selected = NO;
            self.hostLine.backgroundColor = KlineNormalColor;
            self.priceBtn.selected = NO;
            self.priceLine.backgroundColor = KlineNormalColor;
            self.scoreBtn.selected = YES;
            self.scoreLine.backgroundColor = kLineSelectColor;
            self.timeBtn.selected = NO;
            self.timeLine.backgroundColor = KlineNormalColor;
        }
    }
}
- (void)TimeBtnTouchAction
{
    if (_timeBtnBlock) {
        BOOL select = _timeBtnBlock();
        if (select) {
            self.hostBtn.selected = NO;
            self.hostLine.backgroundColor = KlineNormalColor;
            self.priceBtn.selected = NO;
            self.priceLine.backgroundColor = KlineNormalColor;
            self.scoreBtn.selected = NO;
            self.scoreLine.backgroundColor = KlineNormalColor;
            self.timeBtn.selected = YES;
            self.timeLine.backgroundColor = kLineSelectColor;
        }
    }
}
#pragma mark
#pragma mark - 懒加载
- (UIButton *)hostBtn
{
    if (!_hostBtn) {
        _hostBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        NSAttributedString *attributeNormal = [NSAttributedString attributedStringWithGrayString:@"热卖"];
        [_hostBtn setAttributedTitle:attributeNormal forState:UIControlStateNormal];
        NSAttributedString *attributeSelect = [NSAttributedString attributedStringWithString:@"热卖"];
        [_hostBtn setAttributedTitle:attributeSelect forState:UIControlStateSelected];
        _hostBtn.selected = YES;
        
        [_hostBtn addTarget:self action:@selector(hostBtnTouchAction) forControlEvents:UIControlEventTouchDown];
    }
    return _hostBtn;
}
- (UILabel *)hostLine
{
    if (!_hostLine) {
        _hostLine = [[UILabel alloc] init];
        _hostLine.backgroundColor = kLineSelectColor;
    }
    return _hostLine;
}

- (UIButton *)priceBtn
{
    if (!_priceBtn) {
        _priceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        NSAttributedString *attributeNormal = [NSAttributedString attributedStringWithGrayString:@"价格"];
        [_priceBtn setAttributedTitle:attributeNormal forState:UIControlStateNormal];
        NSAttributedString *attributeSelect = [NSAttributedString attributedStringWithString:@"价格"];
        [_priceBtn setAttributedTitle:attributeSelect forState:UIControlStateSelected];
        [_priceBtn addTarget:self action:@selector(priceBtnTouchAction) forControlEvents:UIControlEventTouchDown];
    }
    return _priceBtn;
}
- (UILabel *)priceLine
{
    if (!_priceLine) {
        _priceLine = [[UILabel alloc] init];
        _priceLine.backgroundColor = KlineNormalColor;
    }
    return _priceLine;
}
- (UIButton *)scoreBtn
{
    if (!_scoreBtn) {
        _scoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        NSAttributedString *attributeNormal = [NSAttributedString attributedStringWithGrayString:@"好评"];
        [_scoreBtn setAttributedTitle:attributeNormal forState:UIControlStateNormal];
        NSAttributedString *attributeSelect = [NSAttributedString attributedStringWithString:@"好评"];
        [_scoreBtn setAttributedTitle:attributeSelect forState:UIControlStateSelected];
        
        [_scoreBtn addTarget:self action:@selector(scoreBtnTouchAction) forControlEvents:UIControlEventTouchDown];
    }
    return _scoreBtn;
}
- (UILabel *)scoreLine
{
    if (!_scoreLine) {
        _scoreLine = [[UILabel alloc] init];
        _scoreLine.backgroundColor = KlineNormalColor;
    }
    return _scoreLine;
}
- (UIButton *)timeBtn
{
    if (!_timeBtn) {
        _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        NSAttributedString *attributeNormal = [NSAttributedString attributedStringWithGrayString:@"新品"];
        [_timeBtn setAttributedTitle:attributeNormal forState:UIControlStateNormal];
        NSAttributedString *attributeSelect = [NSAttributedString attributedStringWithString:@"新品"];
        [_timeBtn setAttributedTitle:attributeSelect forState:UIControlStateSelected];
        
        [_timeBtn addTarget:self action:@selector(TimeBtnTouchAction) forControlEvents:UIControlEventTouchDown];
    }
    return _timeBtn;
}
- (UILabel *)timeLine
{
    if (!_timeLine) {
        _timeLine = [[UILabel alloc] init];
        _timeLine.backgroundColor = KlineNormalColor;
    }
    return _timeLine;
}
@end
