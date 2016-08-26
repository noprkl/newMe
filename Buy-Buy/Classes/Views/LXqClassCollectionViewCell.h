//
//  LXqClassCollectionViewCell.h
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXqClassCollectionModel.h"

@interface LXqClassCollectionViewCell : UICollectionViewCell

/** 数据模型 */
@property (strong, nonatomic) LXqClassCollectionModel *collectionModel;
@end
