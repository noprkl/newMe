//
//  LXqGoodsHeaderView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqGoodsHeaderView.h"
#import "LXqGoodsHeaderModel.h"
#import "LXqGoodsTitleModel.h"

#import <SDCycleScrollView.h>
@interface LXqGoodsHeaderView ()<SDCycleScrollViewDelegate>

/** 广告位 */
@property (strong, nonatomic) SDCycleScrollView *headerScrollView;
/** 购买人数 */
@property (strong, nonatomic) UILabel *buyCountLabel;

@end
@implementation LXqGoodsHeaderView
- (void)setGoodsHeaderData:(NSArray *)goodsHeaderData
{
    _goodsHeaderData = goodsHeaderData;
   
    NSArray *modelArr = [LXqGoodsHeaderModel mj_objectArrayWithKeyValuesArray:goodsHeaderData];
    NSMutableArray *headerArr = [NSMutableArray array];
    for (LXqGoodsHeaderModel *model in modelArr) {
        if ([model.ImgType isEqualToString:@"1"]) {
            [headerArr addObject:model.ImgView];
        }
    }
    self.headerScrollView.imageURLStringsGroup = headerArr;
}
- (void)setGoodsTitleData:(NSDictionary *)goodsTitleData
{
    _goodsTitleData = goodsTitleData;
    LXqGoodsTitleModel *titleModel = [LXqGoodsTitleModel mj_objectWithKeyValues:goodsTitleData];
    self.buyCountLabel.text = titleModel.BuyCount;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headerScrollView];
        [self addSubview:self.buyCountLabel];
    }
    return self;
}
- (SDCycleScrollView *)headerScrollView
{
    if (!_headerScrollView) {
        _headerScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:[UIImage imageNamed:@"image0"]];
        _headerScrollView.pageControlStyle = SDCycleScrollViewPageContolAlimentCenter;
        _headerScrollView.autoScrollTimeInterval = 2.5;
    }
    return _headerScrollView;
}
- (UILabel *)buyCountLabel
{
    if (!_buyCountLabel) {
        _buyCountLabel = [[UILabel alloc] init];
        _buyCountLabel.backgroundColor = [UIColor RGBcolorWithRed:230 green:51 blue:37 alpha:1];
        _buyCountLabel.textColor = [UIColor whiteColor];
        _buyCountLabel.layer.cornerRadius = 11;
        _buyCountLabel.layer.masksToBounds = YES;
        _buyCountLabel.font = [UIFont systemFontOfSize:11];
    }
    return _buyCountLabel;
}
- (void)layoutSubviews
{
    [self.headerScrollView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.bottom.equalTo(self.bottom);
    }];
    [self.buyCountLabel makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(85, 22));
        make.right.equalTo(self.right).offset(11);
        make.bottom.equalTo(self.bottom).offset(-30);
    }];
}


@end

