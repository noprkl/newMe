//
//  LXqTimeDFSGoodsModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqTimeDFSGoodsModel : NSObject
/**
 商品ID ： GoodsId
 国家名称 ： CountryName
 国旗图片 ： CountryImg
 缩略图 ：ImgView
 购买数量 ： BuyCount
 折扣 ：Discount
 商品名称：Title
 外币价格：ForeignPrice
 人民币价格：Price
 其他价格 ：OtherPrice
 活动时间（距离结束时间） ：RestTime
 */
/** 国旗图片 */
@property (strong, nonatomic) NSString *CountryImg;

@end
