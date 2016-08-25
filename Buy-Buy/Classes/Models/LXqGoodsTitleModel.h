//
//  LXqGoodsTitleModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqGoodsTitleModel : NSObject
/** 折扣价格 */
@property (strong, nonatomic) NSString *Price;
/** 原价 */
@property (strong, nonatomic) NSString *OriginalPrice;
/** 折扣数 */
@property (strong, nonatomic) NSString *Discount;
/** 购买人数 */
@property (strong, nonatomic) NSString *BuyCount;
/** 标题缩写 */
@property (strong, nonatomic) NSString *Abbreviation;
/** 商品描述 */
@property (strong, nonatomic) NSString *GoodsIntro;
/** 商品id */
@property (strong, nonatomic) NSString *GoodsId;
/** 品牌图标 */
@property (strong, nonatomic) NSString *ShopImage;
/** 品牌名称 */
@property (strong, nonatomic) NSString *BrandCNName;
/** 品牌id */
@property (strong, nonatomic) NSString *ShopId;
/** 品牌国家名 */
@property (strong, nonatomic) NSString *CountryName;
/** 是否收藏 */
@property (strong, nonatomic) NSString *IsCollected;

@end
