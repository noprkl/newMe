//
//  LXqSearchGoodsModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqSearchGoodsModel : NSObject
/**商品简述*/
@property (copy, nonatomic) NSString *Abbreviation;

/**商品标题*/
@property (copy, nonatomic) NSString *Title;

/**老价格*/
@property (copy, nonatomic) NSString *DomesticPrice;

/**当前价格*/
@property (copy, nonatomic) NSString *Price;

/**商品ID*/
@property (copy, nonatomic) NSString *GoodsId;

/**国旗地址*/
@property (copy, nonatomic) NSString *CountryImg;

/**商品图片地址*/
@property (copy, nonatomic) NSString *ImgView;
@end
