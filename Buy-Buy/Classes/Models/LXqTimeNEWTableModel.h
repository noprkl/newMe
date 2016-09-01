//
//  LXqTimeNEWTableModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqTimeNEWTableModel : NSObject
/*
 商品ID : GoodsId
 国家名称 : CountryName
 国旗图片 : CountryImg
 缩略图 :ImgView
 购买数量 : BuyCount
 折扣 :Discount
 商品名称:Title 
 外币价格:ForeignPrice
 人民币价格:Price
 其他价格 :OtherPrice
 活动时间(距离结束时间) :RestTime
 */
/** 商品id */
@property (strong, nonatomic) NSString *GoodsId;
/**  国家名称 */
@property (strong, nonatomic) NSString *CountryName;
/** 国旗 */
@property (strong, nonatomic) NSString *CountryImg;
/** 缩略图 */
@property (strong, nonatomic) NSString *ImgView;
/** 折扣 */
@property (strong, nonatomic) NSString *Discount;
/** 商品名称 */
@property (strong, nonatomic) NSString *Title;
/** 外币价格 */
@property (strong, nonatomic) NSString *ForeignPrice;
/** 原价格 */
@property (strong, nonatomic) NSString *Price;
/** 当前价格 */
@property (strong, nonatomic) NSString *DomesticPrice;
/** 商品描述 */
@property (strong, nonatomic) NSString *GoodsIntro;

@end
