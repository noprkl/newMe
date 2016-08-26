//
//  LXqClassViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqClassViewController.h"

#import "LXqClassCollectionView.h"

#import "LXqSearchViewController.h"//搜索
#import "LXqClassGoodsViewController.h"//同类商品表格
@interface LXqClassViewController ()

/** 表格 */
@property (strong, nonatomic) LXqClassCollectionView *collectionView;
/** 搜素按钮 */
@property (strong, nonatomic) UIButton *searchBtn;
@end

@implementation LXqClassViewController
#pragma mark
#pragma mark - 数据请求
- (void)requestClassCollectionData
{
    /**
     URL:h"p://123.57.141.249:8080/beautalk/appBrandareatype/findBrandareatype.do 传入数据:无
     返回参数:List<Map<String,Object>>
     图片:ImgView
     商品分类ID:GoodsType
     分类名;GoodsTypeName
     
     面部区接口
     URL:h"p://123.57.141.249:8080/beautalk/appBrandarea/asianBrand.do 传入数据:无
     返回参数:List<Map<String,Object>>
     图片:ImgView
     商户ID:ShopId
     CommodityText 自然乐园
     
     //点击collection进入
     全部品牌
     URL:h"p://123.57.141.249:8080/beautalk/appBrandareanew/findBrandareanew.do 传入数据:无
     返回参数:List<Map<String,Object>>
     图片:ImgView
     商户ID:ShopId
     CommodityText
     
     htp://123.57.141.249:8080/beautalk/classifyApp/getGoodsClassify.do
     返回数据：List<Map<String,Object>>
     分类ID：	UUID
     分类名称 ： Title
     包含子类： list    【格式List<Map<String,Object>>】
     list结构：
     分类ID：	TypeId
     分类名称 ： Title
     父级名称 ： ParentId
     
     */
    [self getRequestWithPath:@"classifyApp/getGoodsClassify.do" params:nil success:^(id successJson) {
        if (successJson) {
            self.collectionView.classCollectionData = successJson;
            [self.collectionView reloadData];
        }
    } error:^(NSError *error) {
        NSLog(@"Class_Error--%@", error);
    }];
}

#pragma mark
#pragma mark - 懒加载
- (LXqClassCollectionView *)collectionView
{
    if (!_collectionView) {
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
        _collectionView = [[LXqClassCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flow];
        __weak typeof(self) weakSelf = self;
        _collectionView.selectCellBlock = ^(NSString *cellTypeId, NSString *sectionTypeId, NSString *cellTitle){
            __strong typeof(weakSelf) strongSelf = weakSelf;
            LXqClassGoodsViewController *classGoodsVC = [[LXqClassGoodsViewController alloc] init];
            classGoodsVC.cellTypeId = cellTypeId;
            classGoodsVC.sectionTypeId = sectionTypeId;
            classGoodsVC.cellTitle = cellTitle;
            [strongSelf.navigationController pushViewController:classGoodsVC animated:YES];
        };
    }
    
    return _collectionView;
}
- (UIButton *)searchBtn
{
    if (!_searchBtn) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _searchBtn.backgroundColor = KMaginBackGround;
        [_searchBtn setImage:[UIImage imageNamed:@"限时特卖界面搜索按钮"] forState:(UIControlStateNormal)];
        [_searchBtn setTitle:@"商品/功效/品牌" forState:UIControlStateNormal];
        [_searchBtn addTarget:self action:@selector(pushSearchView) forControlEvents:UIControlEventTouchDown];
    }
    return _searchBtn;
}
/**
 北国风光， 千里冰封，万里雪飘
 望长城内外，惟余莽莽，大河上下，顿失滔滔
 山舞银蛇原驰蜡象，欲与天公试比高，
 须晴日，看红装素裹，分外妖娆
 江山如此多娇，引无数英雄竞折腰。
 惜秦皇汉武，略输文采，唐宗宋祖，稍逊风骚；
 一代天骄成吉思汗，只识弯弓射大雕，
 俱往矣，数风流人物，还看今朝

 */
#pragma mark
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.collectionView];
    [self.collectionView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self requestClassCollectionData];
    self.navigationItem.titleView = self.searchBtn;
}

- (void)pushSearchView
{
    LXqSearchViewController *searchVC = [[LXqSearchViewController alloc] init];
    
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
