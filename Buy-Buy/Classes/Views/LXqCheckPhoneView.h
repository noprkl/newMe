//
//  LXqCheckPhoneView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GetCoderNumberBlock)();
typedef void(^RegisteBtnBlock)(NSString *coderNumber);

@interface LXqCheckPhoneView : UIView

/** 重新获得验证码回调 */
@property (strong, nonatomic) GetCoderNumberBlock coderBlock;
/** 注册按钮回调 */
@property (strong, nonatomic) RegisteBtnBlock  registeBlock;

/** 信息 */
@property (strong, nonatomic) NSDictionary *userInfo;

//倒计时
- (void)timeLast;
@end
