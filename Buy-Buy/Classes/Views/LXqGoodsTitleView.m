//
//  LXqGoodsTitleView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqGoodsTitleView.h"
#import "LXqGoodsTitleModel.h"

@interface LXqGoodsTitleView ()

/** 标题 */
@property (strong, nonatomic) UILabel *titleLabel;
/** 价格 */
@property (strong, nonatomic) UILabel *priceLabel;
/** 线 */
@property (strong, nonatomic) UILabel *lineLabel;
/** 描述 */
@property (strong, nonatomic) UILabel *goodDseLabel;

/** 放置button的view */
@property (strong, nonatomic) UIView *backBtn;
/** 中间button */
@property (strong, nonatomic) UIButton *centerBtn;
/** 图标 */
@property (strong, nonatomic) UIImageView *iconView;
/** 牌子名 */
@property (strong, nonatomic) UILabel *goodsName;
/** 国旗 */
@property (strong, nonatomic) UIImageView *flagView;
/** 国家 */
@property (strong, nonatomic) UILabel *countryName;
/** 注释 */
@property (strong, nonatomic) UILabel *pointLabel;
/** 箭头 */
@property (strong, nonatomic) UIImageView *assceView;


/** 商品详情 */
@property (strong, nonatomic) UILabel *toastLabel;
/** 线 */
@property (strong, nonatomic) UILabel *lineLabel2;
@end
@implementation LXqGoodsTitleView
- (void)setGoodsTitleData:(NSDictionary *)goodsTitleData
{
    _goodsTitleData = goodsTitleData;
    LXqGoodsTitleModel *titleModel = [LXqGoodsTitleModel mj_objectWithKeyValues:goodsTitleData];
    self.titleLabel.text = titleModel.Abbreviation;
    CGFloat titleHeight = [self getLabelHeightWithString:titleModel.Abbreviation size:CGSizeMake(SCREEN_SIZE.width - 50, MAXFLOAT) fontSize:[UIFont boldSystemFontOfSize:15]];
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(titleHeight);
    }];
    
//        NSAttributedString *attributePrice = [NSAttributedString attributedStringWithRedString:titleModel.Price grayString:titleModel.OriginalPrice blackString:titleModel.Discount];
//    self.priceLabel.attributedText = attributePrice;

    NSString *string = [NSString stringWithFormat:@"%@ %@ %@", titleModel.Price, titleModel.OriginalPrice, titleModel.Discount];
    self.priceLabel.text = string;

    CGFloat priceHeight = [self getLabelHeightWithString:string size:CGSizeMake(SCREEN_SIZE.width - 30, MAXFLOAT) fontSize:[UIFont boldSystemFontOfSize:13]];
    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(priceHeight);
    }];
    
    self.goodDseLabel.text = titleModel.GoodsIntro;
    CGFloat DscHeight = [self getLabelHeightWithString:titleModel.GoodsIntro size:CGSizeMake(SCREEN_SIZE.width - 40, MAXFLOAT) fontSize:[UIFont boldSystemFontOfSize:14]];
    [self.goodDseLabel makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(DscHeight);
    }];
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:titleModel.ShopImage]];
    [self.flagView sd_setImageWithURL:[NSURL URLWithString:self.flagUrl]];
    self.goodsName.text = titleModel.BrandCNName;
    self.countryName.text = titleModel.CountryName;
}

- (CGFloat)getLabelHeightWithString:(NSString *)text
                               size:(CGSize)size
                          fontSize:(UIFont *)fontSize
{
    CGFloat height = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:fontSize} context:nil].size.height;
    
    return height;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.goodDseLabel];
        
        [self addSubview:self.backBtn];
        [self.backBtn addSubview:self.centerBtn];
        
        [self.centerBtn addSubview:self.iconView];
        [self.centerBtn addSubview:self.goodsName];
        [self.centerBtn addSubview:self.flagView];
        [self.centerBtn addSubview:self.countryName];
        [self.centerBtn addSubview:self.pointLabel];
        [self.centerBtn addSubview:self.assceView];

        [self addSubview:self.toastLabel];
        [self addSubview:self.lineLabel2];
    }
    return self;
}
#pragma mark
#pragma mark - 约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.lineLabel2.bottom).offset(10);
    }];
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(self.left).offset(25);
        make.right.equalTo(self.right).offset(-25);
    }];
    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(20);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
    }];
    [self.lineLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.bottom).offset(25);
        make.left.equalTo(self.left).offset(15);
        make.right.equalTo(self.right).offset(-15);
        make.height.equalTo(1);
    }];
    [self.goodDseLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineLabel.bottom).offset(15);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
    }];
    
    [self.backBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodDseLabel.bottom).offset(18);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.height.equalTo(100);
    }];
    
    [self.centerBtn makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.backBtn).insets(UIEdgeInsetsMake(10, 0, 10, 0));
    }];
    
    //button的控件
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.centerBtn.top).offset(15);
        make.left.equalTo(self.centerBtn.left).offset(15);
        make.size.equalTo(CGSizeMake(50, 50));
    }];
    [self.goodsName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.centerBtn.top).offset(20);
        make.left.equalTo(self.iconView.right).offset(15);
    }];
    [self.flagView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsName.bottom).offset(10);
        make.left.equalTo(self.iconView.right).offset(15);
        make.size.equalTo(CGSizeMake(15, 15));
    }];
    [self.countryName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsName.bottom).offset(10);
        make.left.equalTo(self.flagView.right).offset(5);
    }];
    [self.pointLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerBtn.centerY);
        make.right.equalTo(self.assceView.left).offset(5);
        make.size.equalTo(CGSizeMake(90, 15));
    }];
    [self.assceView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerBtn.centerY);
        make.right.equalTo(self.centerBtn.right).offset(-15);
    }];
    
    [self.toastLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backBtn.bottom).offset(15);
        make.left.equalTo(self.left).offset(15);
    }];
    
    [self.lineLabel2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.toastLabel.bottom).offset(15);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.height.equalTo(1);
    }];
}

#pragma mark
#pragma mark - 懒加载
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel= [[UILabel alloc] init];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLabel;
}

- (UILabel *)lineLabel
{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = KMLineColor;
    }
    return _lineLabel;
}

- (UILabel *)goodDseLabel
{
    if (!_goodDseLabel) {
        _goodDseLabel = [[UILabel alloc] init];
        _goodDseLabel.numberOfLines = 0;
        _goodDseLabel.font = [UIFont boldSystemFontOfSize:13];
    }
    return _goodDseLabel;
}
- (UIView *)backBtn
{
    if (!_backBtn) {
        _backBtn = [[UIView alloc] init];
        _backBtn.backgroundColor = KMaginBackGround;
    }
    return _backBtn;
}
- (UIButton *)centerBtn
{
    if (!_centerBtn) {
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _centerBtn.backgroundColor = [UIColor whiteColor];
        
        [_centerBtn addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchDown];
    }
    return _centerBtn;
}
- (void)changeColor
{
    self.centerBtn.backgroundColor = [UIColor randomColor];
}
- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.layer.cornerRadius = 5;
        _iconView.layer.masksToBounds = YES;
    }
    return _iconView;
}

- (UILabel *)goodsName
{
    if (!_goodsName) {
        _goodsName = [[UILabel alloc] init];
    }
    return _goodsName;
}

- (UIImageView *)flagView
{
    if (!_flagView) {
        _flagView = [[UIImageView alloc] init];
        _flagView.layer.cornerRadius = 5;
        _flagView.layer.masksToBounds = YES;
    }
    return _flagView;
}

- (UILabel *)countryName
{
    if (!_countryName) {
        _countryName = [[UILabel alloc] init];
    }
    return _countryName;
}

- (UILabel *)pointLabel
{
    if (!_pointLabel) {
        _pointLabel = [[UILabel alloc] init];
        _pointLabel.font = [UIFont systemFontOfSize:12];
        _pointLabel.text = @"(查看同类商品)";
        
    }
    return _pointLabel;
}

- (UIImageView *)assceView
{
    if (!_assceView) {
        _assceView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"下一步"]];
    }
    return _assceView;
}
- (UILabel *)toastLabel
{
    if (!_toastLabel) {
        _toastLabel = [[UILabel alloc] init];
        _toastLabel.text = @"商品详情";
        _toastLabel.font = [UIFont systemFontOfSize:14];
    }
    return _toastLabel;
}
- (UILabel *)lineLabel2
{
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc] init];
        _lineLabel2.backgroundColor = KMLineColor;
    }
    return _lineLabel2;
}
@end
