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
        _NEWBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //图片
        [_NEWBtn setImage:[UIImage imageNamed:@"新品团未选中"] forState:UIControlStateNormal];
        [_NEWBtn setImage:[UIImage imageNamed:@"新品团选中"] forState:UIControlStateSelected];
        _NEWBtn.selected = YES;
        
        //字体
        _NEWBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_NEWBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
        
        NSAttributedString *attributeNormal = [NSAttributedString attributedStringWithString:@"新品团购"];
        [_NEWBtn setAttributedTitle:attributeNormal forState:UIControlStateNormal];
        
        NSAttributedString *attributeSelect = [NSAttributedString attributedStringWithRedString:@"新品团购"];
        [_NEWBtn setAttributedTitle:attributeSelect forState:UIControlStateSelected];
        
        [_NEWBtn addTarget:self action:@selector(showNewTableView) forControlEvents:UIControlEventTouchDown];
        
    }
    return _NEWBtn;
}
- (UIButton *)DFSBtn
{
    if (!_DFSBtn) {
        _DFSBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //图片
        [_DFSBtn setImage:[UIImage imageNamed:@"品牌团未选中"] forState:UIControlStateNormal];
        [_DFSBtn setImage:[UIImage imageNamed:@"品牌团选中"] forState:UIControlStateSelected];
        _DFSBtn.selected = NO;
        //字体
        _DFSBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_DFSBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
        
        NSAttributedString *attributeNormal = [NSAttributedString attributedStringWithString:@"品牌团购"];
        [_DFSBtn setAttributedTitle:attributeNormal forState:UIControlStateNormal];
        
        NSAttributedString *attributeSelect = [NSAttributedString attributedStringWithRedString:@"品牌团购"];
        [_DFSBtn setAttributedTitle:attributeSelect forState:UIControlStateSelected];
        [_DFSBtn addTarget:self action:@selector(showDFSTableView) forControlEvents:UIControlEventTouchDown];
    }
    return _DFSBtn;
}
#pragma mark
#pragma mark - block
- (void)showNewTableView
{
    if (_NEWBtnBlock) {
        BOOL select = _NEWBtnBlock();
        if (select) {
            self.NEWBtn.selected = YES;
            self.DFSBtn.selected = NO;
        }
    }
}
- (void)showDFSTableView
{
    if (_DFSBtnBlock) {
//        _DFSBtnBlock();
       BOOL select = _DFSBtnBlock();
        if (select) {
            self.NEWBtn.selected = NO;
            self.DFSBtn.selected = YES;
        }
    }
}
@end
