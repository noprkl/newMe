//
//  LXqSureGoodsTableViewCell.h
//  Buy-Buy
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXqGoodsSureListModel.h"

@interface LXqSureGoodsTableViewCell : UITableViewCell

/** 商品模型 */
@property (strong, nonatomic) LXqGoodsSureListModel *goodsModel;
@end
