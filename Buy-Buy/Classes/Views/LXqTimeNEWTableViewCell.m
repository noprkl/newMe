//
//  LXqTimeNEWTableViewCell.m
//  Buy-Buy
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 LXq. All rights reserved.
//


#import "LXqTimeNEWTableViewCell.h"

@interface LXqTimeNEWTableViewCell ()
/** 商品图 */
@property (strong, nonatomic) UIImageView *iconView;
/** 国旗 */
@property (strong, nonatomic) UIImageView *flagView;
/** title */
@property (strong, nonatomic) UILabel *titleLabel;
/** 简介 */
@property (strong, nonatomic) UILabel *contentLabel;
/** 价格 */
@property (strong, nonatomic) UILabel *priceLabel;
/** 购物车 */
@property (strong, nonatomic) UIButton *shopCarBtn;
@end
@implementation LXqTimeNEWTableViewCell
- (void)setNEWTableModel:(LXqTimeNEWTableModel *)NEWTableModel
{
    _NEWTableModel = NEWTableModel;
    //SD加载图片
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:NEWTableModel.ImgView]];
    [self.flagView sd_setImageWithURL:[NSURL URLWithString:NEWTableModel.CountryImg]];
    
    self.titleLabel.text = NEWTableModel.Title;
    self.contentLabel.text = NEWTableModel.GoodsIntro;
    
    NSAttributedString *attribute = [NSAttributedString attributedStringWithRedString:NEWTableModel.DomesticPrice grayString:NEWTableModel.Price];
    self.priceLabel.attributedText = attribute;
}
#pragma mark
#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconView];
        [self.iconView addSubview:self.flagView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.shopCarBtn];
    }
    return self;
}
#pragma mark
#pragma mark - 懒加载
- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}
- (UIImageView *)flagView
{
    if (!_flagView) {
        _flagView = [[UIImageView alloc] init];
    }
    return _flagView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.tintColor = [UIColor colorWithRed:81 green:81 blue:81 alpha:1];
    }
    return _titleLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:13];
        _contentLabel.tintColor = [UIColor colorWithRed:35 green:35 blue:35 alpha:1];
        _contentLabel.numberOfLines = 3;
    }
    return _contentLabel;
}
-(UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
    }
    return _priceLabel;
}
- (UIButton *)shopCarBtn
{
    if (!_shopCarBtn) {
        _shopCarBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_shopCarBtn setImage:[UIImage imageNamed:@"限时特卖界面购物车图标"] forState:UIControlStateNormal];
    }
    return _shopCarBtn;
}
#pragma mark
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(142, 142));
        make.centerY.equalTo(self.centerY);
        make.left.equalTo(self.left).offset(5);
    }];
    [self.flagView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 20));
        make.top.equalTo(self.iconView.top).offset(8);
        make.left.equalTo(self.iconView.left).offset(8);
    }];
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(25);
        make.left.equalTo(self.iconView.right).offset(10);
        make.right.equalTo(self.right).offset(-15);
    }];
    [self.contentLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom);
        make.left.equalTo(self.iconView.right).offset(10);
        make.right.equalTo(self.right).offset(-15);
    }];
    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom).offset(-30);
        make.left.equalTo(self.iconView.right).offset(10);
        make.right.equalTo(self.shopCarBtn.left).offset(40);
    }];
    [self.shopCarBtn makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom).offset(-20);
        make.right.equalTo(self.right).offset(-45);
    }];
}
- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
