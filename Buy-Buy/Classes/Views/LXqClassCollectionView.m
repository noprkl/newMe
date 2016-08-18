//
//  LXqClassCollectionView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//


#import "LXqClassCollectionView.h"

#define kSpacing 1
static NSString *cellid = @"classCollectionCellid";
static NSString *headId = @"classCollectionHeaderId";

@interface LXqClassCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>



@end
@implementation LXqClassCollectionView
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
        
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor grayColor];
        self.bounces = NO;
        self.showsVerticalScrollIndicator = NO;
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellid];
        //头部
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headId];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
        UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
        label.text = [NSString stringWithFormat:@"第%ld组-第%ld个", indexPath.section, indexPath.row];
        [cell addSubview:label];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *reusable = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headId forIndexPath:indexPath];
        reusable.backgroundColor = [UIColor RGBcolorWithRed:251 green:244 blue:244 alpha:1];
        return reusable;
    }
    return nil;
}



@end
