//
//  LXqGoodsTitleView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXqGoodsTitleModel.h"

@interface LXqGoodsTitleView : UIView

/** 商品标题数据 */
@property (strong, nonatomic) NSDictionary *goodsTitleData;
/** 国旗 */
@property (strong, nonatomic) NSString *flagUrl;
@end
