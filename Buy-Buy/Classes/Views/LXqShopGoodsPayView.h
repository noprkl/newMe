//
//  LXqShopGoodsPayView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PushPayViewBlock)(NSString *Goods);
@interface LXqShopGoodsPayView : UIView

/** 选中商品数据 */
@property (strong, nonatomic) NSArray *selectedGoods;
/** 支付 */
@property (strong, nonatomic) PushPayViewBlock payBlock;
@end
