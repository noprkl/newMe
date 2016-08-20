//
//  LXqClassCollectionViewCell.h
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXqClassCollectionModel.h"
#import "LXqClassName.h"

@interface LXqClassCollectionViewCell : UICollectionViewCell
/** 模型 */
@property (strong, nonatomic) LXqClassName *className;
@end
