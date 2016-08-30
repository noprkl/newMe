//
//  LXqShopGoodsModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqShopGoodsModel : NSObject
/**
 Abbreviation
 Country
 Discount
 DomesticPrice
 GoodsCount
 GoodsId
 GoodsTitle
 ImgView
 Price
 UUID
 Weight
 返回参数：List<Map<String,Object>>
 商品对应购物车记录标记：UUID
 商品ID：GoodsId
 商品缩略图：ImgView
 商品标题：GoodsTitle
 商品数量：GoodsCount
 国旗图标：Country
 价格：Price
 */
/** title */
@property (strong, nonatomic) NSString *Abbreviation;
/** 购买个数 */
@property (assign, nonatomic) NSInteger GoodsCount;
/** 价格 */
@property (strong, nonatomic) NSString *Price;
/** 商品id */
@property (strong, nonatomic) NSString *GoodsId;
/** 图片 */
@property (strong, nonatomic) NSString *ImgView;
/** UUID */
@property (strong, nonatomic) NSString *UUID;
/** 重量 */
@property (assign, nonatomic) NSInteger Weight;
@end
