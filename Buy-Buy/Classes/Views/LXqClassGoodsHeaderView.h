//
//  LXqClassGoodsHeaderView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^HostBtnTouchBlock)();
typedef BOOL(^PriceBtnTouchBlock)();
typedef BOOL(^ScoreBtnTouchBlock)();
typedef BOOL(^TimeBtnTouchBlock)();

@interface LXqClassGoodsHeaderView : UIView
/** 新品调用 */
@property (copy, nonatomic) HostBtnTouchBlock hostBtnBlock;
@property (copy, nonatomic) PriceBtnTouchBlock priceBtnBlock;
@property (copy, nonatomic) ScoreBtnTouchBlock scoreBtnBlock;
@property (copy, nonatomic) TimeBtnTouchBlock timeBtnBlock;

@end
