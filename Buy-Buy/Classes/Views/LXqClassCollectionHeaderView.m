//
//  LXqClassCollectionHeaderView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/20.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqClassCollectionHeaderView.h"

@interface LXqClassCollectionHeaderView ()

/** 文本 */
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation LXqClassCollectionHeaderView
- (void)setTitleModel:(LXqClassCollectionTitleModel *)TitleModel
{
    _TitleModel = TitleModel;
    self.titleLabel.text = TitleModel.Title;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.left.equalTo(self.left).offset(20);
    }];
    
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.numberOfLines = 1;
        _titleLabel.tintColor = KMLineColor;
//        _titleLabel.backgroundColor = [UIColor RGBcolorWithRed:251 green:244 blue:244 alpha:1];
    }
    return _titleLabel;
}
@end
