//
//  LXqShopCarView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqShopCarView.h"

@interface LXqShopCarView ()
/** 图片 */
@property (strong, nonatomic) UIImageView *shopCarImage;
/** 提示 */
@property (strong, nonatomic) UILabel *tostLabel;
/** 逛一逛 */
@property (strong, nonatomic) UIButton *shoppingBtn;
@end
@implementation LXqShopCarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = KMaginBackGround;
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews
{
    [self addSubview:self.shopCarImage];
    [self addSubview:self.tostLabel];
    [self addSubview:self.shoppingBtn];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.shopCarImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(100);
        //        make.size.equalTo(CGSizeMake(150, 150));
        make.centerX.equalTo(self.centerX);
    }];
    [self.tostLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shopCarImage.bottom).equalTo(10);
        make.centerX.equalTo(self.centerX);
    }];
    [self.shoppingBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tostLabel.bottom).offset(25);
        make.centerX.equalTo(self.centerX);
        make.size.equalTo(CGSizeMake(125, 40));
    }];
}
- (UIImageView *)shopCarImage
{
    if (!_shopCarImage) {
        _shopCarImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"购物车界面静态购物车图标"]];
    }
    return _shopCarImage;
}
- (UILabel *)tostLabel
{
    if (!_tostLabel) {
        _tostLabel = [[UILabel alloc] init];
        _tostLabel.tintColor = [UIColor RGBcolorWithRed:117 green:172 blue:184 alpha:1];
        _tostLabel.text = @"购物车还是空的，快去挑选宝贝吧~";
        _tostLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _tostLabel;
}
- (UIButton *)shoppingBtn
{
    if (!_shoppingBtn) {
        _shoppingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [_shoppingBtn.titleLabel setFont:[UIFont systemFontOfSize:19]];
        [_shoppingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_shoppingBtn setTitle:@"逛一逛" forState:UIControlStateNormal];
        
        [_shoppingBtn setBackgroundColor:[UIColor RGBcolorWithRed:0 green:183 blue:239 alpha:1]];
        
        [_shoppingBtn addTarget:self action:@selector(pushShopingView) forControlEvents:UIControlEventTouchDown];
        
        _shoppingBtn.layer.cornerRadius = 5;
        _shoppingBtn.layer.masksToBounds = YES;
    }
    return _shoppingBtn;
}
- (void)pushShopingView
{
    if (_shoppingBlock) {
        _shoppingBlock();
    }
}

@end
