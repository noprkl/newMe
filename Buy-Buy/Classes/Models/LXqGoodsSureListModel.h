//
//  LXqGoodsSureListModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqGoodsSureListModel : NSObject
/** title */
@property (strong, nonatomic) NSString *Title;
/** Abbreviation */
@property (strong, nonatomic) NSString *Abbreviation;
/** 购买个数 */
@property (assign, nonatomic) NSInteger GoodsCount;
/** 价格 */
@property (strong, nonatomic) NSString *Price;
/** 商品id */
@property (strong, nonatomic) NSString *GoodsId;
/** 图片 */
@property (strong, nonatomic) NSString *ImgView;
/** 库存 */
@property (assign, nonatomic) NSInteger Stock;
/** 重量 */
@property (assign, nonatomic) NSInteger Weight;
/** PriceAndCount */
@property (strong, nonatomic) NSString *PriceAndCount;
@end
