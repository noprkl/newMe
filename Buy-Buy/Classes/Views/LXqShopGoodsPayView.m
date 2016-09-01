//
//  LXqShopGoodsPayView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqShopGoodsPayView.h"
#import "LXqShopGoodsModel.h"

@interface LXqShopGoodsPayView  ()
/** 合计 */
@property (strong, nonatomic) UILabel *allLabel;
/** 钱数 */
@property (strong, nonatomic) UILabel *priceLabel;
/** 全程包邮 */
@property (strong, nonatomic) UILabel *tostLabel;
/** 去结算 */
@property (strong, nonatomic) UIButton *payBtn;
@end
@implementation LXqShopGoodsPayView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.allLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.tostLabel];
        [self addSubview:self.payBtn];
        [self setSelectedGoods:self.selectedGoods];
    }
    return self;
}

- (void)setSelectedGoods:(NSArray *)selectedGoods
{
    _selectedGoods = selectedGoods;

    CGFloat totalPrice = 0;
    for (LXqShopGoodsModel *goodsMoedl in selectedGoods) {
        CGFloat price = [goodsMoedl.Price floatValue];
        NSInteger count = goodsMoedl.GoodsCount;
        totalPrice += price * count * 1.0;
    }

    NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥ %0.2f", totalPrice] attributes:@{NSForegroundColorAttributeName:[UIColor RGBcolorWithRed:255 green:91 blue:61 alpha:1]}];
    self.priceLabel.attributedText = attribute;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.allLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.left).offset(7);
        make.height.equalTo(15);
        make.bottom.equalTo(self.bottom).offset(-30);
    }];
    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.allLabel.right).offset(8);
        make.height.equalTo(15);
    }];
    [self.tostLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.bottom).offset(8);
        make.left.equalTo(self.priceLabel.left);
        make.bottom.equalTo(self.bottom).offset(-10);
    }];
    [self.payBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.right.equalTo(self.right).offset(-15);
        make.size.equalTo(CGSizeMake(110, 35));
        make.bottom.equalTo(self.bottom).offset(-10);
    }];
}
#pragma mark
#pragma mark - 懒加载
- (UILabel *)allLabel
{
    if (!_allLabel) {
        _allLabel = [[UILabel alloc] init];
        _allLabel.text = @"合计:";
        _allLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    return _allLabel;
}
- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = [UIFont boldSystemFontOfSize:15];
        _priceLabel.tintColor = [UIColor RGBcolorWithRed:255 green:76 blue:34 alpha:1];
    }
    return _priceLabel;
}
- (UILabel *)tostLabel
{
    if (!_tostLabel) {
        _tostLabel = [[UILabel alloc] init];
        _tostLabel.text = @"(全场包邮)";
        _tostLabel.textAlignment = NSTextAlignmentRight;
        _tostLabel.tintColor = [UIColor RGBcolorWithRed:100 green:100 blue:100 alpha:1];
    }
    return _tostLabel;
}
- (UIButton *)payBtn
{
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [_payBtn.titleLabel setFont:[UIFont systemFontOfSize:19]];
        [_payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_payBtn setTitle:@"去结算" forState:UIControlStateNormal];
        
        [_payBtn setBackgroundColor:[UIColor RGBcolorWithRed:0 green:183 blue:239 alpha:1]];
        
        [_payBtn addTarget:self action:@selector(pushPayView) forControlEvents:UIControlEventTouchDown];
        
        _payBtn.layer.cornerRadius = 5;
        _payBtn.layer.masksToBounds = YES;
    }
    return _payBtn;
}
- (void)pushPayView
{
    if (_payBlock) {
     
        NSMutableArray *Arr = [NSMutableArray array];
        for (LXqShopGoodsModel *goodsModel in self.selectedGoods) {
          
            if (goodsModel.GoodsCount > 0) {

                NSInteger count = goodsModel.GoodsCount;
                NSString *goodsId = goodsModel.GoodsId;
                NSInteger weight = goodsModel.Weight;
                NSArray *arr = @[@(count), goodsId, @(weight)];
                NSString *uuid_count = [arr componentsJoinedByString:@","];
                [Arr addObject:uuid_count];
            }
        }
        NSString *updateCartMsg = [Arr componentsJoinedByString:@"#"];
        _payBlock(updateCartMsg);
    }
}
@end
