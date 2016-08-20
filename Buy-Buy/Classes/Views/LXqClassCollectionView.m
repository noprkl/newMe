//
//  LXqClassCollectionView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//


#import "LXqClassCollectionView.h"
#import "LXqClassCollectionViewCell.h"//cellview
#import "LXqClassCollectionModel.h"//数据模型

#import "LXqClassCollectionHeaderView.h"//section header view
#define kSpacing 1
static NSString *cellid = @"classCollectionCellid";
static NSString *headId = @"classCollectionHeaderId";

@interface LXqClassCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/** 数据源 */
@property (strong, nonatomic) NSArray *dataArr;

@end
@implementation LXqClassCollectionView
- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [LXqClassCollectionModel loadColoectionModel];
    }
//    for (NSDictionary *dcit in _dataArr) {
//        NSLog(@"%@", dcit);
//    }
    return _dataArr;
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

        flow.scrollDirection = UICollectionViewScrollDirectionVertical;
        flow.headerReferenceSize = CGSizeMake(SCREEN_SIZE.width, 40);
        
        //表格view的属性
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor grayColor];
        self.bounces = NO;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor = KMaginBackGround;
    
        
        [self registerClass:[LXqClassCollectionViewCell class] forCellWithReuseIdentifier:cellid];
        
        
        //头部
        [self registerClass:[LXqClassCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headId];
    }
    return self;
}
#pragma mark - 代理 UICollectionViewDelegate UICollectionViewDataSource
//每组几个
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    LXqClassCollectionModel *classModel = self.dataArr[section];
    
    return classModel.classes.count;
    
//    return [[self.dataArr objectAtIndex:section] count];
}
//组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LXqClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
//        UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
//        label.text = [NSString stringWithFormat:@"第%ld组-第%ld个", indexPath.section, indexPath.row];
//        [cell addSubview:label];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    //数据
    LXqClassCollectionModel *model = self.dataArr[indexPath.section];
    LXqClassName *className = model.classes[indexPath.row];
    cell.className = className;
    
    return cell;
}
#pragma mark - 头部设置
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        
        LXqClassCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headId forIndexPath:indexPath];
        LXqClassCollectionModel *model = self.dataArr[indexPath.section];

        headerView.titleLabel.text = model.sectionTitle;
        
        headerView.backgroundColor = [UIColor RGBcolorWithRed:251 green:244 blue:244 alpha:1];
        
        return headerView;
    }
    
    return nil;
}



@end
