//
//  LXqClassCollectionView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectClassCellBlock)(NSString *cellTypeId, NSString *sectionTypeId, NSString *cellTitle);
@interface LXqClassCollectionView : UICollectionView


/** 数据源 */
@property (copy, nonatomic) NSArray *classCollectionData;

/** 点击分类cell的block回调 */
@property (copy, nonatomic) SelectClassCellBlock selectCellBlock;
@end
