//
//  LXqTimeNEWGoodsViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimeNEWGoodsViewController.h"

#import "LXqGoodsHeaderView.h"
#import "LXqGoodsTitleView.h"
#import "lxqGoodsDetailView.h"
#import "LXqGoodsImageView.h"
#import "LXqGoodsBottomView.h"


@interface LXqTimeNEWGoodsViewController ()<UIScrollViewDelegate>

/** 底部滚动视图 */
@property (strong, nonatomic) UIScrollView *baseScrollView;
/** 广告 */
@property (strong, nonatomic) LXqGoodsHeaderView *goodsHeaderView;
/** 商品标题 */
@property (strong, nonatomic) LXqGoodsTitleView *goodsTitleView;
/** 商品信息 */
@property (strong, nonatomic) LXqGoodsDetailView *goodsDetailView;
/** 商品图片 */
@property (strong, nonatomic) LXqGoodsImageView *goodsImageView;
/** 底部按钮 */
@property (strong, nonatomic) LXqGoodsBottomView *goodsBottomView;
@end

@implementation LXqTimeNEWGoodsViewController
#pragma mark
#pragma mark - 数据请求
//商品图片数据
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
    [self getRequestWithPath:@"appGoods/findGoodsImgList.do"
                      params:parame
                     success:^(id successJson) {
                         if (successJson) {
                             self.goodsHeaderView.goodsHeaderData = successJson;
                             self.goodsImageView.goodsImageData = successJson;
                             
                         }
                     } error:^(NSError *error) {
                         NSLog(@"%@", error);
                     }];
    
}
//商品标题信息数据
- (void)requeatGoodsTitleData
{
    /**
     htp://123.57.141.249:8080/beautalk/appGoods/findGoodsDetailList.do
     传入参数：
     商品ID：GoodsId
     返回数据：List<Map<String,Object>>
     内容标题 ： Title
     详细内容 ： Value
     */
    NSDictionary *parame = @{
                             @"GoodsId" : self.goodsId
                             };
    [self getRequestWithPath:@"appGoods/findGoodsDetail.do" params:parame success:^(id successJson) {
        if (successJson) {
            self.goodsTitleView.goodsTitleData = successJson;
            self.goodsHeaderView.goodsTitleData = successJson;
        }
    } error:^(NSError *error) {
        NSLog(@"Error--%@", error);
    }];
}
//详细信息数据
- (void)requestGoodsDetailData
{
    /**
     htp://123.57.141.249:8080/beautalk/appGoods/findGoodsDetailList.do
     传入参数：
     商品ID：GoodsId
     返回数据：List<Map<String,Object>>
     内容标题 ： Title
     详细内容 ： Value
     */
    NSDictionary *parame = @{
                             @"GoodsId" : self.goodsId
                             };
    [self getRequestWithPath:@"appGoods/findGoodsDetailList.do" params:parame success:^(id successJson) {
        if (successJson) {
            self.goodsDetailView.goodsDetailData = successJson;
        }
    } error:^(NSError *error) {
        NSLog(@"Error--%@", error);
    }];
}

#pragma mark
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = 0;
    [self addSubviews];
    [self createBackBtn];
    
    [self makeConstraints];
    //数据请求
    [self requestGoodsHeaderData];
    [self requeatGoodsTitleData];
    [self requestGoodsDetailData];
}
#pragma mark
#pragma mark - 添加控件
- (void)addSubviews
{
    [self.view addSubview:self.baseScrollView];
    
    [self.baseScrollView addSubview:self.goodsHeaderView];
    [self.baseScrollView addSubview:self.goodsTitleView];
    [self.baseScrollView addSubview:self.goodsDetailView];
    [self.baseScrollView addSubview:self.goodsImageView];

    [self.view addSubview:self.goodsBottomView];
}

#pragma mark
#pragma mark - 约束
- (void)makeConstraints
{
    [self.goodsHeaderView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseScrollView.top);
        make.left.equalTo(self.baseScrollView.left);
        make.right.equalTo(self.view.right);
        make.height.equalTo(280);
    }];
    //
    [self.goodsTitleView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsHeaderView.bottom).offset(20);
        make.left.equalTo(self.baseScrollView.left);
        make.right.equalTo(self.view.right);
    }];
    [self.goodsDetailView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsTitleView.bottom);
        make.left.equalTo(self.baseScrollView.left);
        make.right.equalTo(self.view.right);
    }];
    
    [self.goodsImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsDetailView.bottom);
        make.left.equalTo(self.baseScrollView.left);
        make.right.equalTo(self.view.right);
    }];
    
    [self.goodsBottomView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.bottom);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
    }];
    
}
#pragma mark
#pragma mark - UIScrollViewDelegate代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.baseScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.goodsImageView.frame) + 64);
}
#pragma mark
#pragma mark - 懒加载

- (UIScrollView *)baseScrollView
{
    if (!_baseScrollView) {
        _baseScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        _baseScrollView.contentSize = CGSizeMake(0, 1000);
        _baseScrollView.delegate = self;
        _baseScrollView.showsVerticalScrollIndicator = NO;
    }
    return _baseScrollView;
}
- (LXqGoodsHeaderView *)goodsHeaderView
{
    if (!_goodsHeaderView) {
        _goodsHeaderView = [[LXqGoodsHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 280)];
    }
    return _goodsHeaderView;
}

- (LXqGoodsTitleView *)goodsTitleView
{
    if (!_goodsTitleView) {
        _goodsTitleView = [[LXqGoodsTitleView alloc] init];
        _goodsTitleView.backgroundColor = [UIColor whiteColor];
        _goodsTitleView.flagUrl = self.flagUrl;
    }
    return _goodsTitleView;
}

- (LXqGoodsDetailView *)goodsDetailView
{
    if (!_goodsDetailView) {
        _goodsDetailView = [[LXqGoodsDetailView alloc] init];
    }
    return _goodsDetailView;
}

- (LXqGoodsImageView *)goodsImageView
{
    if (!_goodsImageView) {
        _goodsImageView = [[LXqGoodsImageView alloc] init];

    }
    return _goodsImageView;
}
- (LXqGoodsBottomView *)goodsBottomView
{
    if (!_goodsBottomView) {
        _goodsBottomView = [[LXqGoodsBottomView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 90)];
        _goodsBottomView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_backImage"]];
    }
    return _goodsBottomView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
