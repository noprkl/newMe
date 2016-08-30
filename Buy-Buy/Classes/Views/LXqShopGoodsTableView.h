//
//  LXqShopGoodsTableView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedCellBlock)(NSArray *selectArr);
@interface LXqShopGoodsTableView : UITableView

/** 数据 */
@property (strong, nonatomic) NSArray *shopGoodsData;

/** 传入参数 */
@property (strong, nonatomic) SelectedCellBlock selectedBlock;
@end
