//
//  LXqSureGoodsTableViewCell.m
//  Buy-Buy
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqSureGoodsTableViewCell.h"

@interface LXqSureGoodsTableViewCell ()

/** 商品图片 */
@property (strong, nonatomic) UIImageView *goodsImageView;
/** 名字 */
@property (strong, nonatomic) UILabel *titleLabel;
/** 单价 */
@property (strong, nonatomic) UILabel *perPriceLabel;

@end

@implementation LXqSureGoodsTableViewCell

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.goodsImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.perPriceLabel];
    }
    return self;
}
#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.goodsImageView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(53, 53));
        make.left.equalTo(self.left).offset(40);
        make.centerY.equalTo(self.centerY);
    }];
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(8);
        make.left.equalTo(self.goodsImageView.right).offset(18);
        make.right.equalTo(self.right).offset(10);
    }];
    [self.perPriceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(20);
        make.left.equalTo(self.goodsImageView.right).offset(13);
        //        make.bottom.equalTo(self.bottom).offset(-22);
    }];
   
}
#pragma mark
#pragma mark - 懒加载

- (UIImageView *)goodsImageView
{
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc] init];
    }
    return _goodsImageView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 1;
        _titleLabel.text = @"udsgf";
    }
    return _titleLabel;
}
- (UILabel *)perPriceLabel
{
    if (!_perPriceLabel) {
        _perPriceLabel = [[UILabel alloc] init];
        _perPriceLabel.text = @"200.00";
    }
    return _perPriceLabel;
}

@end
