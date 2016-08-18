//
//  LXqMyRegisetView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PushCheckViewBlock)();

@interface LXqMyRegisetView : UIView

/** checkBlock */
@property (strong, nonatomic) PushCheckViewBlock checkBlock;

@end
