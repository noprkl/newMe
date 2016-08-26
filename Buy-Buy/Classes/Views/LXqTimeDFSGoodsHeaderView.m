//
//  LXqTimeDFSGoodsHeaderView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimeDFSGoodsHeaderView.h"

@interface LXqTimeDFSGoodsHeaderView ()

/** 大图片 */
@property (strong, nonatomic) UIImageView *bigImageView;
/** 小图片 */
@property (strong, nonatomic) UIImageView *smallImageView;
/** 介绍 */
@property (strong, nonatomic) UILabel *goodsIntro;

@end
@implementation LXqTimeDFSGoodsHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bigImageView];
        [self addSubview:self.smallImageView];
        [self addSubview:self.goodsIntro];

    }
    return self;
}
#pragma mark
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.goodsIntro.bottom);
    }];
    [self.bigImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.centerX.equalTo(self.centerX);
        make.size.equalTo(CGSizeMake(230, 230));
    }];
    [self.smallImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(15);
        make.bottom.equalTo(self.bigImageView.bottom).offset(15);
        make.size.equalTo(CGSizeMake(50, 50));
    }];
    [self.goodsIntro makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.smallImageView.bottom).offset(15);
        make.left.equalTo(self.left).offset(15);
        make.right.equalTo(self.right).offset(-15);
    }];
}
#pragma mark
#pragma mark - 懒加载
- (UIImageView *)bigImageView
{
    if (!_bigImageView) {
        _bigImageView = [[UIImageView alloc] init];
        _bigImageView.image = [UIImage imageNamed:@"image0"];
    }
    return _bigImageView;
}
- (UIImageView *)smallImageView
{
    if (!_smallImageView) {
        _smallImageView = [[UIImageView alloc] init];
        _smallImageView.layer.cornerRadius = 5;
        _smallImageView.layer.masksToBounds = YES;
        _smallImageView.image = [UIImage imageNamed:@"image0"];
    }
    return _smallImageView;
}
- (UILabel *)goodsIntro
{
    if (!_goodsIntro) {
        _goodsIntro = [[UILabel alloc] init];
        _goodsIntro.font = [UIFont systemFontOfSize:14];
        _goodsIntro.tintColor = [UIColor RGBcolorWithRed:156 green:156 blue:156 alpha:1];
        _goodsIntro.text = @"fygafhsdfsajkfsdf";
    }
    return _goodsIntro;
}
@end
