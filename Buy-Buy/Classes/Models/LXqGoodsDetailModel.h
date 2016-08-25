//
//  LXqGoodsDetailModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqGoodsDetailModel : NSObject
/**
 内容标题 ： Title
 详细内容 ： Value
 */
/** 内容标题 */
@property (strong, nonatomic) NSString *Title;
/** 详细内容 */
@property (strong, nonatomic) NSString *Value;
@end
