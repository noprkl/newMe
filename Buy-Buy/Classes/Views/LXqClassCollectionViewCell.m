//
//  LXqClassCollectionViewCell.m
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqClassCollectionViewCell.h"

@interface LXqClassCollectionViewCell ()
/** 图片 */
@property (strong, nonatomic, ) UIImageView *iconView;
/** 文字 */
@property (strong, nonatomic) UILabel *contentLabel;

@end

@implementation LXqClassCollectionViewCell
#pragma mark - 赋值（set方法）
- (void)setCollectionModel:(LXqClassCollectionModel *)collectionModel
{
    _collectionModel = collectionModel;
    self.iconView.image = [UIImage imageNamed:collectionModel.icon];
    
    
    NSString *string = collectionModel.content;
    NSMutableAttributedString *mutableAttStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSDictionary *dict1 = @{
                            NSForegroundColorAttributeName:[UIColor grayColor],
                            NSFontAttributeName:[UIFont systemFontOfSize:15]
                            };
    NSRange range1 = NSRangeFromString(string);
    [mutableAttStr addAttributes:dict1 range:range1];
    
    self.contentLabel.attributedText = mutableAttStr;
    
}
//- (instancetype)init
//{
//    if (self = [super init]) {
//        [self.contentView addSubview:self.iconView];
//        [self.contentView addSubview:self.contentLabel];
//    }
//    return self;
//}
#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.contentLabel];
    }
    return self;
}
#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.left).offset(10);
        make.right.equalTo(self.right).offset(-10);
        make.height.equalTo(60);
    }];
    [self.contentLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.bottom);
        make.left.equalTo(self.left).offset(10);
        make.right.equalTo(self.right).offset(-10);
        make.bottom.equalTo(self.bottom).offset(-10);
    }];
    
    
}
#pragma mark - 懒加载
- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        
    }
        return _contentLabel;
}
@end
