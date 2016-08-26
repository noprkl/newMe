//
//  LXqGoodsImageView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqGoodsImageView.h"
#import "LXqGoodsHeaderModel.h"

@interface LXqGoodsImageView ()
@end
@implementation LXqGoodsImageView

- (void)setGoodsImageData:(NSArray *)goodsImageData
{
    _goodsImageData = goodsImageData;
    NSArray *modelArr = [LXqGoodsHeaderModel mj_objectArrayWithKeyValuesArray:goodsImageData];
    CGFloat hight = 0;
    
    for (LXqGoodsHeaderModel *model in modelArr) {
        if ([model.ImgType isEqualToString:@"1"]) {
            NSArray *sizeArr = [model.Resolution componentsSeparatedByString:@"*"];
            
            CGFloat imageHeight = [[sizeArr firstObject] floatValue] / SCREEN_SIZE.width *[[sizeArr lastObject] floatValue];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, hight, SCREEN_SIZE.width, imageHeight)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.ImgView]];
            [self addSubview:imageView];
            
            hight += imageHeight;
        }
    }
    
    [self makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(hight);
    }];
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    [self.goodImageView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.top);
//        make.left.equalTo(self.left);
//        make.right.equalTo(self.right);
//    }];
}
@end
