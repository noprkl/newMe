//
//  LXqTimeDFSGoodsViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimeDFSGoodsViewController.h"

#import "LXqTimeDFSGoodsHeaderView.h"
#import "LXqClassGoodsHeaderView.h"//中间按钮
#import "LXqClassGoodsCollectionView.h"//商品表格

@interface LXqTimeDFSGoodsViewController ()<UIScrollViewDelegate>
/** 底部scrollview */
@property (strong, nonatomic) UIScrollView *baseScrollView;
/** 头部 */
@property (strong, nonatomic) LXqTimeDFSGoodsHeaderView *goodTitleView;
/** 选择按钮 */
@property (strong, nonatomic) LXqClassGoodsHeaderView *goodsHeaderView;
/** 表格 */
@property (strong, nonatomic) LXqClassGoodsCollectionView *goodsCollect;
@end

@implementation LXqTimeDFSGoodsViewController

#pragma mark
#pragma mark - 数据请求
- (void)requestDFSGoodsData
{
    /**
     htp://123.57.141.249:8080/beautalk/appGgroupon/appGrounpGoodsList.do
     传入数据：
     活动ID：GrouponId     【GrouponId对应 首页品牌团中的ActivityId；首页广告位及商城首页广告位的RelatedId】
     排序字段：OrderName   【热卖：host；价格：price；新品：time；好评：score】默认为host
     排序类型：OrderType  正序：ASC；倒序：DESC】
     */
    
    NSDictionary *parame = @{
                             @"GrouponId":self.GrouponId,
                             @"OrderName":@"host",
                             @"OrderType":@"ASC"
                             };
    [self getRequestWithPath:@"appGgroupon/appGrounpGoodsList.do" params:parame success:^(id successJson) {
        NSLog(@"DFSGoodsData%@", successJson);
    } error:^(NSError *error) {
        NSLog(@"DFSGoodsData%@", error);
    }];
    
}
#pragma mark
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.ShopTitle;
    [self requestDFSGoodsData];
    [self addSubviews];
    [self makeConstraints];
}
#pragma mark
#pragma mark - 添加控件
- (void)addSubviews
{
    [self.view addSubview:self.baseScrollView];
    
    [self.baseScrollView addSubview:self.goodTitleView];
    [self.baseScrollView addSubview:self.goodsHeaderView];
    [self.baseScrollView addSubview:self.goodsCollect];
}
#pragma mark
#pragma mark - 约束
- (void)makeConstraints
{
    
   [self.goodTitleView makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.baseScrollView.top);
       make.left.right.equalTo(self.view);
//       make.height.equalTo(280);
   }];
    [self.goodsHeaderView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodTitleView.bottom).offset(15);
        make.left.right.equalTo(self.view);
        make.height.equalTo(44);
    }];
    [self.goodsCollect makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsHeaderView.bottom);
        make.left.equalTo(self.view.left);
        make.size.equalTo(CGSizeMake(SCREEN_SIZE.width, SCREEN_SIZE.height));
    }];
    
}
#pragma mark
#pragma mark - UIScrollViewDelegate代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //重新设置滑动范围
    CGFloat goodTitleY = CGRectGetMaxY(self.goodTitleView.frame);
    CGFloat goodCollectY = self.goodsCollect.frame.size.height;
    self.baseScrollView.contentSize = CGSizeMake(0, goodCollectY + goodTitleY + 44);
    
    //固定选择按钮
    CGRect goodheaderRect = self.goodsHeaderView.frame;
    if (scrollView.contentOffset.y > goodCollectY) {
        goodheaderRect.origin.y = scrollView.contentOffset.y + 44;
    }else{
        goodheaderRect.origin.y = goodTitleY + 44;
    }
    self.goodsHeaderView.frame = goodheaderRect;
}

#pragma mark
#pragma mark - 懒加载
- (UIScrollView *)baseScrollView
{
    if (!_baseScrollView) {
        _baseScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        _baseScrollView.contentSize = CGSizeMake(0, 1000);
        _baseScrollView.backgroundColor = KMaginBackGround;
        _baseScrollView.delegate = self;
    }
    return _baseScrollView;
}
- (LXqTimeDFSGoodsHeaderView *)goodTitleView
{
    if (!_goodTitleView) {
        _goodTitleView = [[LXqTimeDFSGoodsHeaderView alloc] init];
    }
    return _goodTitleView;
}
- (LXqClassGoodsHeaderView *)goodsHeaderView
{
    if (!_goodsHeaderView) {
        _goodsHeaderView = [[LXqClassGoodsHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 44)];
    }
    return _goodsHeaderView;
}
- (LXqClassGoodsCollectionView *)goodsCollect
{
    if (!_goodsCollect) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        
        _goodsCollect = [[LXqClassGoodsCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 30 /2 * 215) collectionViewLayout:flow];
        _goodsCollect.bounces = NO;
        _goodsCollect.backgroundColor = KMaginBackGround;
    }
    return _goodsCollect;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
