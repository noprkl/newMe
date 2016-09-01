//
//  LXqGoodsSureModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXqShopGoodsModel.h"
@interface LXqGoodsSureModel : NSObject

/** 确认的商品 */
@property (strong, nonatomic) NSArray *GoodsList;
/** 总价格 */
@property (strong, nonatomic) NSString *GoodsPrice;
/** 支付信息 */
@property (strong, nonatomic) NSDictionary *PayList;

@end
