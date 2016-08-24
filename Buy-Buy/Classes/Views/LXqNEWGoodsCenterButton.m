//
//  LXqNEWGoodsCenterButton.m
//  Buy-Buy
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqNEWGoodsCenterButton.h"

@interface LXqNEWGoodsCenterButton ()

/** 图标 */
@property (strong, nonatomic) UIImageView *iconView;
/** 牌子名 */
@property (strong, nonatomic) UILabel *goodsName;
/** 国旗 */
@property (strong, nonatomic) UIImageView *flagView;
/** 国家 */
@property (strong, nonatomic) UILabel *countryName;
/** 注释 */
@property (strong, nonatomic) UILabel *tostLabel;
/** 箭头 */
@property (strong, nonatomic) UIImageView *assceView;

@end

@implementation LXqNEWGoodsCenterButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconView];
        [self addSubview:self.goodsName];
        [self addSubview:self.flagView];
        [self addSubview:self.countryName];
        [self addSubview:self.tostLabel];
        [self addSubview:self.assceView];
    }
    return self;
}
#pragma mark
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(15);
        make.left.equalTo(self.left).offset(15);
        make.size.equalTo(CGSizeMake(50, 50));
    }];
    [self.goodsName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(25);
        make.left.equalTo(self.iconView.left).offset(15);
    }];
    [self.flagView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsName.top).offset(15);
        make.left.equalTo(self.iconView.left).offset(15);
        make.size.equalTo(CGSizeMake(15, 15));
    }];
    [self.countryName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsName.top).offset(15);
        make.left.equalTo(self.flagView.left).offset(5);
    }];
    [self.tostLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.right.equalTo(self.assceView.left).offset(5);
        make.size.equalTo(CGSizeMake(90, 15));
    }];
    [self.assceView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.right.equalTo(self.right).offset(-15);
    }];
}
#pragma mark
#pragma mark - 懒加载
- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.layer.cornerRadius = 5;
        _iconView.layer.masksToBounds = YES;
    }
    return _iconView;
}
- (UILabel *)goodsName
{
    if (!_goodsName) {
        _goodsName = [[UILabel alloc] init];
    }
    return _goodsName;
}
- (UIImageView *)flagView
{
    if (!_flagView) {
        _flagView = [[UIImageView alloc] init];
        _flagView.layer.cornerRadius = 5;
        _flagView.layer.masksToBounds = YES;
    }
    return _flagView;
}
- (UILabel *)countryName
{
    if (!_countryName) {
        _countryName = [[UILabel alloc] init];
    }
    return _countryName;
}
- (UILabel *)tostLabel
{
    if (!_tostLabel) {
        _tostLabel = [[UILabel alloc] init];
        _tostLabel.tintColor = [UIColor grayColor];
        _tostLabel.font = [UIFont systemFontOfSize:12];
        _tostLabel.text = @"(查看同品牌商品)";

    }
    return _tostLabel;
}
- (UIImageView *)assceView
{
    if (!_assceView) {
        _assceView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"下一步"]];
    }
    return _assceView;
}
@end
