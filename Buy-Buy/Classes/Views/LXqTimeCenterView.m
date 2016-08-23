//
//  LXqTimeCenterView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimeCenterView.h"

@interface LXqTimeCenterView ()

/** 新品团购Button */
@property (strong, nonatomic) UIButton *NEWBtn;
/** 品牌团购 */
@property (strong, nonatomic) UIButton *DFSBtn;

@end

@implementation LXqTimeCenterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.NEWBtn];
        [self addSubview:self.DFSBtn];
    }
    return self;
}
#pragma mark
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.borderWidth = 1;
    self.layer.borderColor = KMLineColor.CGColor;
    
    [self.NEWBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(self.left);
        make.bottom.equalTo(self.bottom);
        make.right.equalTo(self.centerX);
    }];
    [self.DFSBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.right.equalTo(self.right);
        make.bottom.equalTo(self.bottom);
        make.left.equalTo(self.centerX);
    }];
}
#pragma mark
#pragma mark - 懒加载

- (UIButton *)NEWBtn
{
    if (!_NEWBtn) {
        _NEWBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        //图片
        [_NEWBtn setImage:[UIImage imageNamed:@"限时特卖界面新品团购图标"] forState:UIControlStateNormal];
        //字体
        NSAttributedString *attribute = [NSAttributedString attributedStringWithRedString:@"新品团购"];
        [_NEWBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
        [_NEWBtn setAttributedTitle:attribute forState:UIControlStateNormal];
        
        [_NEWBtn addTarget:self action:@selector(showNewTableView) forControlEvents:UIControlEventTouchDown];
    }
    return _NEWBtn;
}
- (UIButton *)DFSBtn
{
    if (!_DFSBtn) {
        _DFSBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        //图片
        [_DFSBtn setImage:[UIImage imageNamed:@"限时特卖界面品牌团购图标"] forState:UIControlStateNormal];
        //字体
        NSAttributedString *attribute = [NSAttributedString attributedStringWithString:@"品牌团购"];
        _DFSBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_DFSBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
        [_DFSBtn setAttributedTitle:attribute forState:UIControlStateNormal];
        
        [_DFSBtn addTarget:self action:@selector(showDFSTableView) forControlEvents:UIControlEventTouchDown];
    }
    return _DFSBtn;
}
#pragma mark
#pragma mark - block
- (void)showNewTableView
{
    if (_NEWBtnBlock) {
        _NEWBtnBlock();
    }
}
- (void)showDFSTableView
{
    if (_DFSBtnBlock) {
        _DFSBtnBlock();
    }
}
@end
