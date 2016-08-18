//
//  LXqMyHeaderView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 跳转 */
typedef void(^RegisteViewBlock)();

@interface LXqMyHeaderView : UIView

/** block */
@property (copy, nonatomic) RegisteViewBlock registeBlock;
@end
