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
/** 下一步imageView */
@property (strong, nonatomic) UIImageView *nextImageView;
/** 线 */
@property (strong, nonatomic) UILabel *lineLabel;
@end

@implementation LXqMyTableViewCell

- (void)setMyModel:(LXqMyTableModel *)myModel
{
    _myModel = myModel;
    self.iconImageView.image = [UIImage imageNamed:myModel.icon];
    self.titleLabel.text = myModel.title;
}
#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.nextImageView];
        [self.contentView addSubview:self.lineLabel];
    
    }
    return self;
}
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(15);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconImageView.mas_centerY);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(15);
        make.top.mas_equalTo(self.mas_top).offset(10);
    }];
   
    [self.nextImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.mas_equalTo(self.titleLabel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.right.mas_equalTo(self.mas_right).offset(-20);
    }];
   
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_SIZE.width, 2));
        make.bottom.mas_equalTo(self.mas_bottom).offset(-2);
    }];
    
}

#pragma mark -懒加载
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
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UIImageView *)nextImageView
{
    if (!_nextImageView) {
        UIImage *image = [UIImage imageNamed:@"下一步"];
        _nextImageView = [[UIImageView alloc] initWithImage:image];
        
    }
    return _nextImageView;
}

- (UILabel *)lineLabel
{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_backImage"]];
    }
    return _lineLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
