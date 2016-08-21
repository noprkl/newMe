//
//  LXqMyLoginView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PushMyViewBlock)(NSDictionary *loginInfo);
typedef void(^QQLoginBlock)();
typedef void(^WXLoginBlock)();
typedef void(^SinaLoginBlock)();

@interface LXqMyLoginView : UIView
/** 跳转push */
@property (strong, nonatomic) PushMyViewBlock myViewBlock;
/** qq登录 */
@property (strong, nonatomic) QQLoginBlock qqBlock;
/** 微信登录 */
@property (strong, nonatomic) WXLoginBlock wxBlock;
/** 新浪登录 */
@property (strong, nonatomic) SinaLoginBlock sinaBlock;
@end
