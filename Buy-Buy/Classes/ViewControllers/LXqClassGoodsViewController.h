//
//  LXqClassGoodsViewController.h
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqBaseViewController.h"

@interface LXqClassGoodsViewController : LXqBaseViewController

/** 头部id */
@property (strong, nonatomic) NSString *sectionTypeId;
/** cellid */
@property (strong, nonatomic) NSString *cellTypeId;
/** cell标题 */
@property (strong, nonatomic) NSString *cellTitle;

@end
