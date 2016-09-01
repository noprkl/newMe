//
//  LXqShopGoodsTableViewCell.m
//  Buy-Buy
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqShopGoodsTableViewCell.h"

@interface LXqShopGoodsTableViewCell ()

/** 选中图片 */
//@property (strong, nonatomic, ) UIImageView *selectImageView;
/** 商品图片 */
@property (strong, nonatomic) UIImageView *goodsImageView;
/** 名字 */
@property (strong, nonatomic) UILabel *titleLabel;
/** 单价 */
@property (strong, nonatomic) UILabel *perPriceLabel;
/** 背景图 */
@property (strong, nonatomic) UIImageView *backImage;
/** 添加计数按钮 */
@property (strong, nonatomic) UIButton *addBtn;
/** 个数 */
@property (strong, nonatomic) UILabel *goodsCount;
/**  减少按钮*/
@property (strong, nonatomic) UIButton *cutBtn;

@end

@implementation LXqShopGoodsTableViewCell
- (void)setShopGoodsModel:(LXqShopGoodsModel *)shopGoodsModel
{
    _shopGoodsModel = shopGoodsModel;
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:shopGoodsModel.ImgView]];
    self.titleLabel.text = shopGoodsModel.Abbreviation;
    
    self.perPriceLabel.text = shopGoodsModel.Price;
    self.goodsCount.text = [@(shopGoodsModel.GoodsCount) stringValue];
}
#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.selectImageView];
        [self.contentView addSubview:self.goodsImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.perPriceLabel];

        [self.contentView addSubview:self.backImage];
        [self.contentView addSubview:self.addBtn];
        [self.contentView addSubview:self.goodsCount];
        [self.contentView addSubview:self.cutBtn];

    }
    return self;
}
#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
   
    [self.selectImageView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(21, 21));
        make.left.equalTo(self.left).offset(15);
        make.centerY.equalTo(self.centerY);
    }];
    
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
    [self.backImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(13);
        make.size.equalTo(CGSizeMake(75, 25));
        make.right.equalTo(self.right).offset(-15);
        //        make.bottom.equalTo(self.bottom).offset(-15);
    }];
    [self.cutBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backImage.top);
        make.size.equalTo(CGSizeMake(25, 25));
        make.right.equalTo(self.goodsCount.left);
//        make.bottom.equalTo(self.bottom).offset(-15);
    }];
    [self.goodsCount makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backImage.top);
        make.size.equalTo(CGSizeMake(25, 25));
        make.right.equalTo(self.addBtn.left);
//        make.bottom.equalTo(self.bottom).offset(-15);
    }];
    [self.addBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backImage.top);
        make.size.equalTo(CGSizeMake(25, 25));
        make.right.equalTo(self.backImage.right);
//        make.bottom.equalTo(self.bottom).offset(-15);
    }];
    
}
#pragma mark
#pragma mark - 懒加载
- (UIImageView *)selectImageView
{
    if (!_selectImageView) {
        _selectImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"购物车界面商品选中对号按钮"]];
    }
    return _selectImageView;
}
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
    }
    return _titleLabel;
}
- (UILabel *)perPriceLabel
{
    if (!_perPriceLabel) {
        _perPriceLabel = [[UILabel alloc] init];
    }
    return _perPriceLabel;
}
- (UIImageView *)backImage
{
    if (!_backImage) {
        _backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"购物车界面商品加减按钮"]];
    
    }
    return _backImage;
}
- (UIButton *)cutBtn
{
    if (!_cutBtn) {
        _cutBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_cutBtn addTarget:self action:@selector(cutBtnAction) forControlEvents:UIControlEventTouchDown];
    }
    return _cutBtn;
}
- (UILabel *)goodsCount
{
    if (!_goodsCount) {
        _goodsCount = [[UILabel alloc] init];
        _goodsCount.textAlignment = NSTextAlignmentCenter;
        _goodsCount.layer.borderColor = KMLineColor.CGColor;
    }
    return _goodsCount;
}
- (UIButton *)addBtn
{
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_addBtn addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchDown];
    }
    return _addBtn;
}
- (void)cutBtnAction
{
//    if (self.shopGoodsModel.GoodsCount == 0) {
//        self.cutBtn.enabled = NO;
//    }else{
//        self.cutBtn.enabled = YES;
//        if (_cutBlock) {
//            _cutBlock();
//        }
//    }
    if (_cutBlock) {
        _cutBlock();
    }
}
- (void)addBtnAction
{
//    if (self.shopGoodsModel.GoodsCount == 100) {
//        self.cutBtn.enabled = NO;
//    }
    if (_addBlock) {
        _addBlock();
    }
}
@end
