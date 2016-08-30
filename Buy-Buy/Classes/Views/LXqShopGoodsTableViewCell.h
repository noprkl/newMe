//
//  LXqShopGoodsTableViewCell.h
//  Buy-Buy
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXqShopGoodsModel.h"

typedef void(^CutGoodsBtnBlock)();
typedef void(^AddGoodsBtnBlock)();
@interface LXqShopGoodsTableViewCell : UITableViewCell

/** 选中图片 */
@property (strong, nonatomic, ) UIImageView *selectImageView;
/** 商品模型 */
@property (strong, nonatomic) LXqShopGoodsModel *shopGoodsModel;

/** 减号按钮 */
@property (strong, nonatomic) CutGoodsBtnBlock cutBlock;
/** 加号按钮 */
@property (strong, nonatomic) AddGoodsBtnBlock addBlock;
@end
