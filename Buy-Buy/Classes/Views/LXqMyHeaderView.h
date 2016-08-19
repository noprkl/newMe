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
typedef void(^LoginViewBlock)();

@interface LXqMyHeaderView : UIView

/** block */
@property (copy, nonatomic) RegisteViewBlock registeBlock;
/** <#注释#> */
@property (copy, nonatomic) LoginViewBlock loginBlock;

@end
