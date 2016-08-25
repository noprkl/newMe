//
//  LXqGoodsHeaderModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqGoodsHeaderModel : NSObject
/**
 图片地址 ： ImgView
 图片类型 ： ImgType   【1.轮播位图片；2.详情图片；3.实拍图片】
 图片高度 ： Resolution
 */
/** 图片地址 */
@property (strong, nonatomic) NSString *ImgView;
/** 图片类型 */
@property (strong, nonatomic) NSString *ImgType;
/** 图片高度 */
@property (strong, nonatomic) NSString *Resolution;

@end
