//
//  LXqGoodsBottomView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddShopCarBlock)();
@interface LXqGoodsBottomView : UIView
/** <#注释#> */
@property (strong, nonatomic) AddShopCarBlock addBlock;
@end
