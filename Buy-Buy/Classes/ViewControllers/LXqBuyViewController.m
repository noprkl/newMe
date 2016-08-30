//
//  LXqBuyViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqBuyViewController.h"
//没有商品
#import "LXqShopCarView.h"
//有商品
#import "LXqShopGoodsTableView.h"
#import "LXqShopGoodsPayView.h"
#import "LXqShopGoodsModel.h"

//点击跳转
#import "LXqTimeViewController.h"//限时购
#import "LXqSureOrderViewController.h"//支付界面
@interface LXqBuyViewController ()<UITableViewDelegate>
/** 没商品时图片 */
@property (strong, nonatomic) LXqShopCarView *NoneGoodsView;
/** 有商品时显示table */
@property (strong, nonatomic) LXqShopGoodsTableView *goodsTableView;
/** 显示下方view */
@property (strong, nonatomic) LXqShopGoodsPayView *goodsPayView;
/** 编辑按钮 */
@property (strong, nonatomic) UIBarButtonItem *editItem;

@end

@implementation LXqBuyViewController
#pragma mark
#pragma mark - 数据请求
- (void)requestShopCarData
{
    /** 传入数据：会员登录名 ：MemberId*/

    NSDictionary *islog = [[NSUserDefaults standardUserDefaults] valueForKey:@"ISLOGIN"];
    [self getRequestWithPath:@"appShopCart/appCartGoodsList.do" params:@{@"MemberId":islog[@"MemberId"]} success:^(id successJson) {
        if (successJson) {
            //传入数据
            self.goodsTableView.shopGoodsData = successJson;
            MyLog(@"%@", successJson);
            [self.goodsTableView reloadData];
        }
    } error:^(NSError *error) {
        NSLog(@"%@", error);
    }];
   
}

#pragma mark  更新购物车
- (void)updataShopGoods:(NSArray *)dataArr
{
    NSMutableArray *Arr = [NSMutableArray array];

    for (LXqShopGoodsModel *goodsModel in dataArr) {
        NSInteger count = goodsModel.GoodsCount;
        NSString *uuid = goodsModel.UUID;
        NSArray *arr = @[uuid, @(count)];
        NSString *uuid_count = [arr componentsJoinedByString:@","];
        [Arr addObject:uuid_count];
    }

    NSString *updateCartMsg = [Arr componentsJoinedByString:@"#"];

    /**htp://123.57.141.249:8080/beautalk/appShopCart/appUpdateCart.do
     传入数据：
     拼装字符串标记：updateCartMsg
     格式：购物记录UUID,商品数量#购物记录UUID，商品数量#......
     */
    [self getRequestWithPath:@"appShopCart/appUpdateCart.do" params:@{@"updateCartMsg":updateCartMsg} success:^(id successJson) {
//        MyLog(@"%@", successJson);
    } error:^(NSError *error) {
        MyLog(@"%@", error);
    }];
}
#pragma mark
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = 0;
    NSDictionary *islog = [[NSUserDefaults standardUserDefaults] valueForKey:@"ISLOGIN"];
       //判断是否登录
    if (islog.count > 0) {
        [self addGoodsSubviews];
    }else{
        [self addNoneGoodsSubviews];
    }
    NSLog(@"%s", __func__);
}
- (void)viewWillAppear:(BOOL)animated
{
    [self.goodsTableView reloadData];

    [self requestShopCarData];
}
- (void)addNoneGoodsSubviews
{
    [self.view addSubview:self.NoneGoodsView];
}

- (void)addGoodsSubviews
{
    [self.view addSubview:self.goodsTableView];
    [self.view addSubview:self.goodsPayView];
    self.navigationItem.rightBarButtonItem = self.editItem;
    [self makeConstraints];

}
#pragma mark 约束
- (void)makeConstraints
{
    [self.goodsPayView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.bottom);
        make.left.equalTo(self.view.left);
        make.size.equalTo(CGSizeMake(SCREEN_SIZE.width, 55));
    }];
}

#pragma mark 方法
- (void)editingItemAction
{
    self.goodsTableView.editing = !self.goodsTableView.editing ;
}
#pragma mark
#pragma mark - 懒加载

- (UIBarButtonItem *)editItem
{
    if (!_editItem) {
        _editItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editingItemAction)];
    }
    return _editItem;
}
- (LXqShopGoodsTableView *)goodsTableView
{
    if (!_goodsTableView) {
        _goodsTableView = [[LXqShopGoodsTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height - 200) style:UITableViewStylePlain];
        _goodsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        __weak typeof(self) weakSelf = self;
        _goodsTableView.selectedBlock = ^(NSArray *selectArr){
            weakSelf.goodsPayView.selectedGoods = selectArr;
            [weakSelf performSelector:@selector(updataShopGoods:) withObject:selectArr];
        };
    }
    return _goodsTableView;
}
- (LXqShopGoodsPayView *)goodsPayView
{
    if (!_goodsPayView) {
        _goodsPayView = [[LXqShopGoodsPayView alloc] init];
        _goodsPayView.backgroundColor = [UIColor whiteColor];

        __weak typeof(self) weakSelf = self;
        
        _goodsPayView.payBlock = ^(NSString *Goods){
            __strong typeof(weakSelf) strSelf = weakSelf;
            LXqSureOrderViewController *sureVC = [[LXqSureOrderViewController alloc] init];
            sureVC.Goods = Goods;
            [strSelf.navigationController pushViewController:sureVC animated:YES];
        };
    }
    return _goodsPayView;
}
- (LXqShopCarView *)NoneGoodsView
{
    if (!_NoneGoodsView) {
        _NoneGoodsView = [[LXqShopCarView alloc] initWithFrame:self.view.frame];
        __weak typeof(self) weakSelf = self;
        _NoneGoodsView.shoppingBlock = ^(){
            __strong typeof(weakSelf) strSelf = weakSelf;
            //跳到限时购界面
            LXqTimeViewController *timeVC = [[LXqTimeViewController alloc] init];
            [strSelf.navigationController pushViewController:timeVC animated:YES];
            
        };
    }
    return _NoneGoodsView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
