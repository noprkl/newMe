//
//  LXqGoodsBottomView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqGoodsBottomView.h"

@interface LXqGoodsBottomView ()
/** 线 */
@property (strong, nonatomic) UILabel *lineLabel;
/** 背景图 */
@property (strong, nonatomic) UIImageView *backImage;
/** 购物车按钮 */
@property (strong, nonatomic) UIButton *shopCarBtn;
/** 加入购物 */
@property (strong, nonatomic) UIButton *addShopCar;
/** 立即购买 */
@property (strong, nonatomic) UIButton *promptBuy;
@end

@implementation LXqGoodsBottomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backImage];
        [self addSubview:self.lineLabel];
        [self addSubview:self.shopCarBtn];
        [self addSubview:self.addShopCar];
        [self addSubview:self.promptBuy];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_backImage"]];
    }
    return self;
}
#pragma mark
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.backImage makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(1, 0, 0, 0));
    }];
    [self.lineLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.right.equalTo(self.right);
        make.left.equalTo(self.left);
        make.height.equalTo(1);
    }];
    [self.shopCarBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.left.equalTo(self.left).offset(13);
        make.size.equalTo(CGSizeMake(26, 26));
    }];
    
    [self.addShopCar makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.left.equalTo(self.shopCarBtn.right).offset(35);
        make.height.equalTo(35);
        make.width.equalTo(self.promptBuy.width);
    }];
    
    [self.promptBuy makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.left.equalTo(self.addShopCar.right).offset(15);
        make.right.equalTo(self.right).offset(-15);
        make.height.equalTo(35);
    }];
}


#pragma mark
#pragma mark - 懒加载
- (UIImageView *)backImage
{
    if (!_backImage) {
        _backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_backImage"]];
    }
    return _backImage;
}
- (UILabel *)lineLabel
{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = KMLineColor;
    }
    return _lineLabel;
}
- (UIButton *)shopCarBtn
{
    if (!_shopCarBtn) {
        _shopCarBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_shopCarBtn setImage:[UIImage imageNamed:@"详情界面购物车按钮"] forState:UIControlStateNormal];
    }
    return _shopCarBtn;
}
- (UIButton *)addShopCar
{
    if (!_addShopCar) {
        _addShopCar = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _addShopCar.tintColor = [UIColor whiteColor];
        _addShopCar.backgroundColor = [UIColor RGBcolorWithRed:41 green:214 blue:247 alpha:1];
        _addShopCar.layer.cornerRadius = 10;
        _addShopCar.layer.masksToBounds = YES;
        [_addShopCar setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_addShopCar addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchDown];
        
    }
    return _addShopCar;
}
- (void)addBtnAction
{
    if (_addBlock) {
        _addBlock();
    }
}
- (UIButton *)promptBuy
{
    if (!_promptBuy) {
        _promptBuy = [UIButton buttonWithType:UIButtonTypeCustom];
        _promptBuy.tintColor = [UIColor whiteColor];
        _promptBuy.backgroundColor = [UIColor RGBcolorWithRed:41 green:214 blue:247 alpha:1];
        _promptBuy.layer.cornerRadius = 10;
        _promptBuy.layer.masksToBounds = YES;
        [_promptBuy setTitle:@"立即购买" forState:UIControlStateNormal];
    }
    return _promptBuy;
}
@end
