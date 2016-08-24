//
//  LXqTimeDFSTableViewCell.m
//  Buy-Buy
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimeDFSTableViewCell.h"

@interface LXqTimeDFSTableViewCell ()

@property (strong, nonatomic) UIImageView *iconImageView;

@end

@implementation LXqTimeDFSTableViewCell
- (void)setDFSModel:(LXqTimeDFSTableModel *)DFSModel
{
    _DFSModel = DFSModel;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:DFSModel.ImgView]];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconImageView];
    }
    return self;
}
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.bottom.equalTo(self.bottom).offset(-10);
    }];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
