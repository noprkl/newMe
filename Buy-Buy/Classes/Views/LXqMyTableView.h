//
//  LXqMyTableView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ViewHiddenBlock)(SEL);

@interface LXqMyTableView : UITableView

/** 控件隐藏 */
@property (strong, nonatomic) ViewHiddenBlock hideBlock;

@end
