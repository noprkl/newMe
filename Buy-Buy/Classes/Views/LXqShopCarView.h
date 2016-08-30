//
//  LXqShopCarView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GoShoppingBlock)();
@interface LXqShopCarView : UIView

/** 逛一逛按钮 */
@property (strong, nonatomic) GoShoppingBlock shoppingBlock;

@end
