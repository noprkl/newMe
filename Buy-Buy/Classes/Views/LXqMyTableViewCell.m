//
//  LXqMyTableViewCell.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqMyTableViewCell.h"

@interface LXqMyTableViewCell ()

/** 图片 */
@property (strong, nonatomic) UIImageView *iconImageView;
/** title */
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation LXqMyTableViewCell

- (void)setMyModel:(LXqMyTableModel *)myModel
{
    _myModel = myModel;
    self.iconImageView.image = [UIImage imageNamed:myModel.icon];
    self.titleLabel.text = myModel.title;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.iconImageView];
        [self addSubview:self.titleLabel];
    
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(15);
//        make.bottom.mas_equalTo(self.mas_bottom).offset(-30);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconImageView.mas_centerY);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(15);
        make.top.mas_equalTo(self.mas_top).offset(10);
//        make.bottom.mas_equalTo(self.mas_bottom).offset(-30);
    }];
}
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
