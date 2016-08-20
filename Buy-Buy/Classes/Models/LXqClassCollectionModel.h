//
//  LXqClassCollectionModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqClassCollectionModel : NSObject


/** 分类名字 */
@property (strong, nonatomic) NSArray *classes;
/** sectionTitle */
@property (strong, nonatomic) NSString *sectionTitle;

/** KVC */
+ (NSArray *)loadColoectionModel;
@end
