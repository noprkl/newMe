//
//  LXqMyRegisetView.h
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PushCheckViewBlock)(NSDictionary *userInfo);
typedef void(^QQLoginBlock)();
typedef void(^WXLoginBlock)();
typedef void(^SinaLoginBlock)();

@interface LXqMyRegisetView : UIView

/** checkBlock */
@property (strong, nonatomic) PushCheckViewBlock checkBlock;
/** qq登录 */
@property (strong, nonatomic) QQLoginBlock qqBlock;
/** 微信登录 */
@property (strong, nonatomic) WXLoginBlock wxBlock;
/** 新浪登录 */
@property (strong, nonatomic) SinaLoginBlock sinaBlock;

@end
