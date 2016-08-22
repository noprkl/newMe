//
//  LXqMyTableView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReloadTableViewBlock)();

@interface LXqMyTableView : UITableView

/** 刷新tableview */
@property (strong, nonatomic) ReloadTableViewBlock reloadBlock;
@end
