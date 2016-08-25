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
@property (strong, nonatomic) UIImageView *goodImageView;
@end
@implementation LXqGoodsImageView

- (void)setGoodsImageData:(NSArray *)goodsImageData
{
    _goodsImageData = goodsImageData;
    
    NSArray *modelArr = [LXqGoodsHeaderModel mj_objectArrayWithKeyValuesArray:goodsImageData];
    CGFloat hight = 0;
    for (LXqGoodsHeaderModel *model in modelArr) {
        if ([model.ImgType isEqualToString:@"2"]) {

//            [self.goodImageView sd_setImageWithURL:[NSURL URLWithString:model.ImgType]];
//            [self.goodImageView makeConstraints:^(MASConstraintMaker *make) {
//                make.size.equalTo(CGSizeFromString(model.Resolution));
//            }];

            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, hight, SCREEN_SIZE.width, MAXFLOAT)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.ImgView]];
            
            hight += [model.Resolution floatValue];
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
- (UIImageView *)goodImageView
{
    if (!_goodImageView) {
        _goodImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _goodImageView;
}
- (void)layoutSubviews
{
//    [self.goodImageView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.top);
//        make.left.equalTo(self.left);
//        make.right.equalTo(self.right);
//    }];
}
@end
