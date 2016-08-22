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

//刷新
typedef void(^ReloadHeaderBlock)();

@interface LXqMyHeaderView : UIView

/** 登录按钮回调 */
@property (copy, nonatomic) LoginViewBlock loginBlock;
/** 注册按钮回调 */
@property (copy, nonatomic) RegisteViewBlock registeBlock;
/** 刷新header */
@property (copy, nonatomic) ReloadHeaderBlock reloadBock;

- (void)viewHiddenMedthod;

///** 登录按钮 */
//@property (strong, nonatomic) UIButton *loginBtn;
///** 注册按钮 */
//@property (strong, nonatomic) UIButton *regisBtn;
//
//登录成功
/** 头像 */
@property (strong, nonatomic) UIImageView *iconView;
/** 用户名 */
@property (strong, nonatomic) UILabel *userNameLabel;
/** 等级 */
@property (strong, nonatomic) UILabel *userLevelLabel;
@end
