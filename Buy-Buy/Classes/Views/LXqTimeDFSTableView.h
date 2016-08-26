//
//  LXqTimeDFSTableView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PushDFSGoodsViewBlock)(NSString *ActivityId, NSString *ShopTitle);

@interface LXqTimeDFSTableView : UITableView

/** 数据源 */
@property (strong, nonatomic) NSArray *dataArr;

/** 跳转到详细的DFS界面 */
@property (strong, nonatomic) PushDFSGoodsViewBlock pushDFSBlock;
@end
