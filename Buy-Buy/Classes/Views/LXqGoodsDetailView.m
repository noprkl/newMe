//
//  LXqGoodsDetailView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqGoodsDetailView.h"
#import "LXqGoodsDetailModel.h"

@implementation LXqGoodsDetailView

- (void)setGoodsDetailData:(NSArray *)goodsDetailData
{
    _goodsDetailData = goodsDetailData;
    NSArray *detailModelArr = [LXqGoodsDetailModel mj_objectArrayWithKeyValuesArray:goodsDetailData];
    
    //给个高度
    CGFloat detailHeight = 0;
    for (LXqGoodsDetailModel *detailModel in detailModelArr) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, detailHeight, 60, 12)];
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.text = detailModel.Title;
        [self addSubview:titleLabel];
        
        CGFloat contentHeight = [detailModel.Value boundingRectWithSize:CGSizeMake(SCREEN_SIZE.width - 190, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.height;
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, detailHeight, SCREEN_SIZE.width - 190, contentHeight)];
        contentLabel.font = [UIFont systemFontOfSize:12];
        contentLabel.text = detailModel.Value;
        [self addSubview:contentLabel];
        
        detailHeight = detailHeight + contentHeight +15;
    }
    
    [self makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(detailHeight);
    }];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end
