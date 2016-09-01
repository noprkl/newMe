//
//  LXqSureGoodsBottomView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PushPayMoneyBlock)(NSString *price);
@interface LXqSureGoodsBottomView : UIView

/** 选中商品价格 */
@property (strong, nonatomic) NSString *totalPrice;

/** 跳转 */
@property (strong, nonatomic) PushPayMoneyBlock payBlock;
@end
