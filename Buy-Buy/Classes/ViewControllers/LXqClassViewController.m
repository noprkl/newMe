//
//  LXqClassViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqClassViewController.h"
#import "LXqClassCollectionView.h"


#import "LXqClassGoodsViewController.h"
@interface LXqClassViewController ()

/** 表格 */
@property (strong, nonatomic) LXqClassCollectionView *collectionView;
@end

@implementation LXqClassViewController
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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self requestClassCollectionData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
