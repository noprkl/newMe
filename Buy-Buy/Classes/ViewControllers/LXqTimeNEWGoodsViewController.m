//
//  LXqTimeNEWGoodsViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimeNEWGoodsViewController.h"
#import <MJExtension.h>
#import <SDCycleScrollView.h>
//#import "LXqGoodsDataModel.h"

#import "LXqNEWGoodsCenterButton.h"

@interface LXqTimeNEWGoodsViewController ()<SDCycleScrollViewDelegate, UIScrollViewDelegate>

/** 底部滚动视图 */
@property (strong, nonatomic) UIScrollView *baseScrollView;
/** 广告 */
@property (strong, nonatomic) SDCycleScrollView *goodsHeaderView;
/** 购买人数 */
@property (strong, nonatomic) UILabel *buyCountLabel;
/** 背景 */
@property (strong, nonatomic) UIView *goodsBackView;
/** 标题 */
@property (strong, nonatomic) UILabel *titleLabel;
/** 价格 */
@property (strong, nonatomic) UILabel *priceLabel;
/** 线 */
@property (strong, nonatomic) UILabel *lineLabel;
/** 描述 */
@property (strong, nonatomic) UILabel *goodDseLabel;

/** 中间button */
@property (strong, nonatomic) LXqNEWGoodsCenterButton *centerBtn;
@end

@implementation LXqTimeNEWGoodsViewController

- (UIScrollView *)baseScrollView
{
    if (!_baseScrollView) {
        _baseScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        _baseScrollView.contentSize = CGSizeMake(0, 1000);
        _baseScrollView.delegate = self;
        _baseScrollView.backgroundColor = KMaginBackGround;
    }
    return _baseScrollView;
}
- (SDCycleScrollView *)goodsHeaderView
{
    if (!_goodsHeaderView) {
        _goodsHeaderView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 300) delegate:self placeholderImage:[UIImage imageNamed:@"image0"]];
        _goodsHeaderView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _goodsHeaderView.autoScrollTimeInterval = 3;
    }
    return _goodsHeaderView;
}
- (UILabel *)buyCountLabel
{
    if (!_buyCountLabel) {
        _buyCountLabel = [[UILabel alloc] init];
        _buyCountLabel.backgroundColor = [UIColor RGBcolorWithRed:255 green:76 blue:34 alpha:1];
        _buyCountLabel.textAlignment = NSTextAlignmentLeft;
        _buyCountLabel.textColor = [UIColor whiteColor];
        _buyCountLabel.layer.cornerRadius = 11;
        _buyCountLabel.layer.masksToBounds = YES;
        _buyCountLabel.font = [UIFont systemFontOfSize:13];
        _buyCountLabel.text = @"100人已购买";
    }
    return _buyCountLabel;
}
- (UIView *)goodsBackView
{
    if (!_goodsBackView) {
        _goodsBackView = [[UIView alloc] init];
        _goodsBackView.backgroundColor = [UIColor whiteColor];
    }
    return _goodsBackView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:22];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"sytfjafhbgvjyftrfhtfthchfcthrchtfchtdfjhasbfjahfsdygf";
    }
    return _titleLabel;
}
- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel= [[UILabel alloc] init];
        _priceLabel.font = [UIFont boldSystemFontOfSize:21];
        _priceLabel.backgroundColor = [UIColor whiteColor];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.text = @"yughbhygdresresrefdcfcdfus";
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
        _goodDseLabel.font = [UIFont boldSystemFontOfSize:20];
        _goodDseLabel.backgroundColor = [UIColor whiteColor];
        _goodDseLabel.textAlignment = NSTextAlignmentLeft;
        
        _goodDseLabel.text = @"dsuiytftrdyrdtrdrtedrdredredrhfdjfuierfue";
        _goodDseLabel.tintColor = KMLineColor;
    }
    return _goodDseLabel;
}
- (LXqNEWGoodsCenterButton *)centerBtn
{
    if (!_centerBtn) {
        _centerBtn = [[LXqNEWGoodsCenterButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 80)];
        [_centerBtn setBackgroundImage:[UIImage imageNamed:@"我的背景"] forState:UIControlStateNormal];
        _centerBtn.backgroundColor = [UIColor whiteColor];
    }
    return _centerBtn;
}

#pragma mark
#pragma mark - 数据请求
- (void)requestGoodsHeaderData
{
    /**
     htp://123.57.141.249:8080/beautalk/appGoods/findGoodsImgList.do
     传入参数：
     商品ID：GoodsId
     返回数据：List<Map<String,Object>>
     图片地址 ： ImgView
     图片类型 ： ImgType   【1.轮播位图片；2.详情图片；3.实拍图片】
     图片高度 ： Resolution
     */
    NSDictionary *parame = @{
                             @"GoodsId":self.goodsId
                             };
//    __weak typeof(self) weakSelf = self;
    [self getRequestWithPath:@"appGoods/findGoodsImgList.do"
                      params:parame
                     success:^(id successJson) {
                         NSMutableArray *dataArr = [NSMutableArray array];
                         for (NSDictionary *dict in successJson) {
                             if ([dict[@"ImgType"] isEqualToString:@"1"]) {
                             NSString *imageUrl = dict[@"ImgView"];
                             [dataArr addObject:imageUrl];
                             }
                         }
                         self.goodsHeaderView.imageURLStringsGroup = dataArr;
                         NSLog(@"%@", dataArr);
                     } error:^(NSError *error) {
                         NSLog(@"%@", error);
    }];
    
}
#pragma mark
#pragma mark - 约束
- (void)makeConstraints
{
    [self.buyCountLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.goodsHeaderView.right).offset(11);
        make.bottom.equalTo(self.goodsHeaderView.bottom).offset(-30);
        make.height.equalTo(22);
    }];
    //
    [self.goodsBackView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsHeaderView.bottom);
        make.left.equalTo(self.baseScrollView.left);
        make.right.equalTo(self.view.right);
        make.bottom.equalTo(self.goodDseLabel.bottom).offset(15);
    }];
    
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsBackView.top).offset(15);
        make.left.equalTo(self.goodsBackView.left);
        make.right.equalTo(self.goodsBackView.right);
    }];
    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(27);
        make.left.equalTo(self.goodsBackView.left);
        make.right.equalTo(self.goodsBackView.right);
    }];
    [self.lineLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.bottom).offset(26);
        make.left.equalTo(self.goodsBackView.left).offset(20);
        make.right.equalTo(self.goodsBackView.right).offset(-20);
        make.height.equalTo(1);
    }];
    [self.goodDseLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineLabel.bottom).offset(20);
        make.left.equalTo(self.goodsBackView.left).offset(18);
        make.right.equalTo(self.goodsBackView.right);
    }];
    [self.centerBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsBackView.bottom).offset(10);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.height.equalTo(80);
    }];
}
#pragma mark
#pragma mark - 添加控件
- (void)addSubviews
{
    [self.view addSubview:self.baseScrollView];
    
    [self.baseScrollView addSubview:self.goodsHeaderView];
    [self.baseScrollView addSubview:self.buyCountLabel];

    [self.baseScrollView addSubview:self.goodsBackView];
    [self.goodsBackView addSubview:self.titleLabel];
    [self.goodsBackView addSubview:self.priceLabel];
    [self.goodsBackView addSubview:self.lineLabel];
    [self.goodsBackView addSubview:self.goodDseLabel];
    
    [self.baseScrollView addSubview:self.centerBtn];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    [self addSubviews];
    [self makeConstraints];
    
    [self requestGoodsHeaderData];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
