//
//  LXqClassCollectionModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqClassCollectionModel : NSObject

//分类collection模型属性
/** 图片 */
@property (strong, nonatomic) NSString *icon;
/** 文字 */
@property (strong, nonatomic) NSString *content;


/** KVC */
+ (NSArray *)loadColoectionModel;
@end
