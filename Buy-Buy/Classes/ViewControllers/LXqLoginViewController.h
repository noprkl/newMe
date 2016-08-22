//
//  LXqLoginViewController.h
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqBaseViewController.h"

typedef void(^GetUserMessageBlock)(NSDictionary *userMessage);

@interface LXqLoginViewController : LXqBaseViewController

/** <#注释#> */
@property (strong, nonatomic) GetUserMessageBlock getMessageBlock;

@end
