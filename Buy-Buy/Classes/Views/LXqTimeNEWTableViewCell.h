//
//  LXqTimeNEWTableViewCell.h
//  Buy-Buy
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXqTimeNEWTableModel.h"

typedef void(^ShopCarBtnBlock)(UIButton *shopCarBtn);

@interface LXqTimeNEWTableViewCell : UITableViewCell

/** 模型 */
@property (strong, nonatomic) LXqTimeNEWTableModel *NEWTableModel;
/** shopCar点击 */
@property (strong, nonatomic) ShopCarBtnBlock NEWGoodidBlock;
@end
