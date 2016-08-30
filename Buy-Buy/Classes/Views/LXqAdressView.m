//
//  LXqAdressView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqAdressView.h"

@interface LXqAdressView ()
/** 背景 */
@property (strong, nonatomic) UIImageView *backImageView;
/** 位置 */
@property (strong, nonatomic) UIImageView *addressImage;
/** 地址 */
@property (strong, nonatomic) UILabel *addressLabel;
@end
@implementation LXqAdressView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backImageView];
        [self addSubview:self.addressImage];
        [self addSubview:self.addressLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.backImageView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.addressImage makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.left.equalTo(self.left).offset(10);
    }];
    [self.addressLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.left.equalTo(self.addressImage.right).offset(5);
        make.right.equalTo(self.right).offset(10);
    }];
}
- (UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"地址背景"]];
    }
    return _backImageView;
}
- (UIImageView *)addressImage
{
    if (!_addressImage) {
        _addressImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"位置"]];
    }
    return _addressImage;
}
- (UILabel *)addressLabel
{
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.numberOfLines = 0;
        _addressLabel.font = [UIFont systemFontOfSize:13];
        _addressLabel.text = @"asugyfukyfguwrbciwrIKGHUDFKFISYFGH";
    }
    return _addressLabel;
}
@end
