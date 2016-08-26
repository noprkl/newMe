//
//  LXqClassGoodsCollectionView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//
#define kSpacing 5

#import "LXqClassGoodsCollectionView.h"
#import "LXqClassGoodsCollectionViewCell.h"

static NSString *cellid = @"classCollectionCellid";

@interface LXqClassGoodsCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
///** 数据源 */
//@property (strong, nonatomic) NSArray *dataArr;
@end
@implementation LXqClassGoodsCollectionView

- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSArray array];
    }
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
        flow.itemSize = CGSizeMake(SCREEN_SIZE.width/2.0 - kSpacing, 215);

//        flow.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        //表格view的属性
        self.delegate = self;
        self.dataSource = self;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor = [UIColor whiteColor];
        
        //注册cell
        [self registerClass:[LXqClassGoodsCollectionViewCell class] forCellWithReuseIdentifier:cellid];
    }
    return self;
}
#pragma mark - 代理 UICollectionViewDelegate UICollectionViewDataSource
//每组几个
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 30;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LXqClassGoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    label.text = @"suyfgauf";
    [cell addSubview:label];
    label.backgroundColor = [UIColor randomColor];
    
    return cell;
}

@end
