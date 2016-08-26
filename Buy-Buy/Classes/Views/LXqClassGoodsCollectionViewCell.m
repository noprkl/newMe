//
//  LXqClassGoodsCollectionViewCell.m
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqClassGoodsCollectionViewCell.h"

@interface LXqClassGoodsCollectionViewCell ()

/** 国旗 */
@property (strong, nonatomic) UIImageView *flagView;
/** 商品图 */
@property (strong, nonatomic) UIImageView *goodsImgView;
/** 标题 */
@property (strong, nonatomic) UILabel *goodsTitle;
/** 价格 */
@property (strong, nonatomic) UILabel *priceLabel;
@end

@implementation LXqClassGoodsCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.goodsImgView];
        [self addSubview:self.flagView];
        [self addSubview:self.goodsTitle];
        [self addSubview:self.priceLabel];
    }
    return self;
}
#pragma mark
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.flagView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(11);
        make.left.equalTo(self.left).offset(10);
        make.size.equalTo(CGSizeMake(22, 17));
    }];
    [self.goodsImgView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(30);
        make.left.equalTo(self.left).offset(30);
        make.right.equalTo(self.right).offset(30);
        make.height.equalTo(130);
//        make.bottom.equalTo(self.goodsTitle.bottom).offset(10);

    }];
    [self.goodsTitle makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsImgView.bottom).offset(10);
        make.left.equalTo(self.left).offset(11);
        make.right.equalTo(self.right).offset(11);
    }];
    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsTitle.bottom).offset(10);
        make.left.equalTo(self.left).offset(11);
        make.right.equalTo(self.right).offset(11);
        make.bottom.equalTo(self.bottom).offset(13);
    }];
    
}
#pragma mark
#pragma mark - 懒加载
- (UIImageView *)flagView
{
    if (!_flagView) {
        _flagView = [[UIImageView alloc] init];
    }
    return _flagView;
}
- (UIImageView *)goodsImgView
{
    if (!_goodsImgView) {
        _goodsImgView = [[UIImageView alloc] init];
    }
    return _goodsImgView;
}
- (UILabel *)goodsTitle
{
    if (!_goodsTitle) {
        _goodsTitle = [[UILabel alloc] init];
        _goodsTitle.numberOfLines = 2;
        _goodsTitle.font = [UIFont boldSystemFontOfSize:14];
        _goodsTitle.text = @"hakfhsdb";
    }
    return _goodsTitle;
}
- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLabel;
}
@end
