//
//  LXqClassCollectionTitleModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//  头部标题模型

#import <Foundation/Foundation.h>

@interface LXqClassCollectionTitleModel : NSObject

/** 标题 */
@property (strong, nonatomic) NSString *Title;
/** 类型 */
@property (strong, nonatomic) NSString *TypeId;
/** 列表 */
@property (strong, nonatomic) NSArray *list;
@end
