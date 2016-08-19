//
//  LXqMyLoginView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PushMyViewBlock)();
@interface LXqMyLoginView : UIView
/** <#注释#> */
@property (strong, nonatomic) PushMyViewBlock myViewBlock;
@end
