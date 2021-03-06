//
//  LXqClassCollectionView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//


#import "LXqClassCollectionView.h"

//view
#import "LXqClassCollectionViewCell.h"//cellview
#import "LXqClassCollectionHeaderView.h"//section header view

//数据模型
#import "LXqClassCollectionModel.h"
#import "LXqClassCollectionTitleModel.h"
#define kSpacing 1

static NSString *cellid = @"classCollectionCellid";
static NSString *headId = @"classCollectionHeaderId";

@interface LXqClassCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/** 头部数据源 */
@property (strong, nonatomic) NSArray *titleDataArr;
/** collection数据源 */
@property (strong, nonatomic) NSArray *CollectionDataArr;
@end
@implementation LXqClassCollectionView
- (NSArray *)titleDataArr
{
    if (!_titleDataArr) {
        _titleDataArr = [NSArray array];
    }
    return _titleDataArr;
}
- (NSArray *)CollectionDataArr
{
    if (!_CollectionDataArr) {
        _CollectionDataArr = [NSArray array];
    }
    return _CollectionDataArr;
}
- (void)setClassCollectionData:(NSArray *)classCollectionData
{
    //得到头部的数据
    NSArray *titleModelArr = [LXqClassCollectionTitleModel mj_objectArrayWithKeyValuesArray:classCollectionData];
    self.titleDataArr = titleModelArr;
    
    NSMutableArray *collectionModelArr = [NSMutableArray array];
    for (LXqClassCollectionTitleModel *titleModel in titleModelArr) {
        NSArray *classListArr = [LXqClassCollectionModel mj_objectArrayWithKeyValuesArray:titleModel.list];
        [collectionModelArr addObject:classListArr];
    }
    self.CollectionDataArr = collectionModelArr;
    
}
#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        //强转
        UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout *)layout;
        
        flow.minimumInteritemSpacing = kSpacing;
        flow.minimumLineSpacing = kSpacing;
        flow.itemSize = CGSizeMake((SCREEN_SIZE.width - kSpacing * 3) / 4.0, 100);
        flow.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
        flow.scrollDirection = UICollectionViewScrollDirectionVertical;
        flow.headerReferenceSize = CGSizeMake(SCREEN_SIZE.width, 40);
        
        //表格view的属性
        self.delegate = self;
        self.dataSource = self;
//        self.bounces = NO;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor = [UIColor whiteColor];
        
        //注册cell
        [self registerClass:[LXqClassCollectionViewCell class] forCellWithReuseIdentifier:cellid];
        //注册头部
        [self registerClass:[LXqClassCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headId];
    }
    return self;
}
#pragma mark - 代理 UICollectionViewDelegate UICollectionViewDataSource
//每组几个
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    LXqClassCollectionTitleModel *titleModel = self.titleDataArr[section];

    return titleModel.list.count;

}
//组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return self.titleDataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LXqClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
//        UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
//        [cell addSubview:label];
    LXqClassCollectionModel *collectionModel = self.CollectionDataArr[indexPath.section][indexPath.row];
    
    cell.collectionModel = collectionModel;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectCellBlock) {
        LXqClassCollectionModel *collectionModel = self.CollectionDataArr[indexPath.section][indexPath.row];
        
        _selectCellBlock([collectionModel TypeId], [self.titleDataArr[indexPath.section] TypeId], [collectionModel Title]);
    }
}
#pragma mark - 头部设置
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        
        LXqClassCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headId forIndexPath:indexPath];
        headerView.TitleModel = self.titleDataArr[indexPath.section];

        headerView.backgroundColor = [UIColor RGBcolorWithRed:251 green:244 blue:244 alpha:1];
        
        return headerView;
    }
    
    return nil;
}




@end
