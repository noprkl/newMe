//
//  LXqTimeCenterView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NEWBtnTouchBlock)();
typedef void(^DFSBtnTouchBlock)();

@interface LXqTimeCenterView : UIView
/** 新品调用 */
@property (copy, nonatomic) NEWBtnTouchBlock NEWBtnBlock;
@property (copy, nonatomic) DFSBtnTouchBlock DFSBtnBlock;
@end
