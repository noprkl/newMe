//
//  LXqSureOrderViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqSureOrderViewController.h"
#import "LXqAdressView.h"
#import "LXqSureGoodsTableView.h"
#import "LXqSureGoodsBottomView.h"
@interface LXqSureOrderViewController ()
/** 发货地址 */
@property (strong, nonatomic) LXqAdressView *adressView;
/** 商品 */
@property (strong, nonatomic) LXqSureGoodsTableView *goodsTableView;
/** 底部view */
@property (strong, nonatomic) LXqSureGoodsBottomView *goodsPayView;
@end

@implementation LXqSureOrderViewController
#pragma mark
#pragma mark - 请求数据
- (void)requestGoodsPayData{
    
    NSDictionary *parame = @{
                             @"Goods":self.Goods
                             };
    [self getRequestWithPath:@"appOrder/gotoInsert.do" params:parame success:^(id successJson) {
        MyLog(@"%@", successJson);
    } error:^(NSError *error) {
        MyLog(@"%@", error);
    }];
    /*
     URL：htp://123.57.141.249:8080/beautalk/appOrder/gotoInsert.do
     传入数据：
     商品标识：Goods
     */
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randomColor];
    self.edgesForExtendedLayout = 0;

    [self.view addSubview:self.adressView];
    [self.view addSubview:self.goodsTableView];
    [self.view addSubview:self.goodsPayView];
    [self.goodsPayView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.bottom);
        make.left.equalTo(self.view.left);
        make.size.equalTo(CGSizeMake(SCREEN_SIZE.width, 55));
    }];
    [self requestGoodsPayData];
}
#pragma mark
#pragma mark - 懒加载
- (LXqAdressView *)adressView
{
    if (!_adressView) {
        _adressView = [[LXqAdressView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 80)];
    }
    return _adressView;
}
- (LXqSureGoodsTableView *)goodsTableView
{
    if (!_goodsTableView) {
        _goodsTableView = [[LXqSureGoodsTableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.adressView.frame), SCREEN_SIZE.width, SCREEN_SIZE.height - 200) style:UITableViewStylePlain];
        _goodsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//        __weak typeof(self) weakSelf = self;
       
    }
    return _goodsTableView;
}
- (LXqSureGoodsBottomView *)goodsPayView
{
    if (!_goodsPayView) {
        _goodsPayView = [[LXqSureGoodsBottomView alloc] init];
        _goodsPayView.backgroundColor = [UIColor whiteColor];
        __weak typeof(self) weakSelf = self;
        
    }
    return _goodsPayView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
