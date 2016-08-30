//
//  LXqClassGoodsViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqClassGoodsViewController.h"

#import "LXqClassGoodsHeaderView.h"
#import "LXqClassGoodsCollectionView.h"

@interface LXqClassGoodsViewController ()

/** 头部 */
@property (strong, nonatomic) LXqClassGoodsHeaderView *headerView;
/** collection */
@property (strong, nonatomic) LXqClassGoodsCollectionView *collectionView;
@end

@implementation LXqClassGoodsViewController
- (LXqClassGoodsHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[LXqClassGoodsHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 44)];
        _headerView.backgroundColor = [UIColor whiteColor];
        _headerView.hostBtnBlock = ^(){
            return YES;
        };
        _headerView.priceBtnBlock = ^(){
            return YES;
        };
        _headerView.scoreBtnBlock = ^(){
            return YES;
        };
        _headerView.timeBtnBlock = ^(){
            return YES;
        };
    }
    return _headerView;

}
- (LXqClassGoodsCollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[LXqClassGoodsCollectionView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_SIZE.width, SCREEN_SIZE.height - 108) collectionViewLayout:flow];
        
        _collectionView.backgroundColor = KMaginBackGround;
    }
    return _collectionView;
}
#pragma mark
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.cellTitle;
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.collectionView];
    [self requestTimeDFSGoodsData];
    
}
#pragma mark
#pragma mark - 数据请求
- (void)requestClassGoodsData
{

}
- (void)requestTimeDFSGoodsData
{
    /**
     htp://123.57.141.249:8080/beautalk/appGgroupon/appGrounpGoodsList.do
     传入数据：
     活动ID：GrouponId     【GrouponId对应 首页品牌团中的ActivityId；首页广告位及商城首页广告位的RelatedId】
     排序字段：OrderName   【热卖：host；价格：price；新品：time；好评：score】默认为host
     排序类型：OrderType  正序：ASC；倒序：DESC】
     */
    
    NSDictionary *parame = @{
                             @"GrouponId":self.cellTypeId,
                             @"OrderName":@"host",
                             @"OrderType":@"ASC"
                             };
    [self getRequestWithPath:@"appGgroupon/appGrounpGoodsList.do" params:parame success:^(id successJson) {
        MyLog(@"DFSGoodsData%@", successJson);
    } error:^(NSError *error) {
        MyLog(@"DFSGoodsData%@", error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
