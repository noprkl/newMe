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

/** 调动控件隐藏 */
typedef void(^ViewHiddenBlock)(SEL action);

@interface LXqMyHeaderView : UIView

/** 登录按钮回调 */
@property (copy, nonatomic) LoginViewBlock loginBlock;
/** 注册按钮回调 */
@property (copy, nonatomic) RegisteViewBlock registeBlock;

/** 控件隐藏 */
@property (strong, nonatomic) ViewHiddenBlock hideBlock;

//- (void)hideViewMetdod;
@end
