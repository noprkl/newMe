//
//  LXqBaseViewController.h
//  Buy-Buy
//
//  Created by ma c on 16/8/20.
//  Copyright © 2016年 LXq. All rights reserved.

//  ViewController基类

#import <UIKit/UIKit.h>

typedef void(^HttpRequestSuccessBlock)(id successJson);
typedef void(^HttpRequestErrorBlock)(NSError *error);

@interface LXqBaseViewController : UIViewController

- (void)getRequestWithPath:(NSString *)path
                    params:(NSDictionary *)params
                   success:(HttpRequestSuccessBlock)returnSuccess
                     error:(HttpRequestErrorBlock)returnError;
- (void)postRequestWithPath:(NSString *)path
                     params:(NSDictionary *)params
                    success:(HttpRequestSuccessBlock)returnSuccess
                      error:(HttpRequestErrorBlock)returnError;
/** 第三方登录 */
- (void)QQLoginMethod;
- (void)WXLoginMethod;
- (void)SinaLoginMethod;

/** 提示框 */
- (void)showToastMessage:(NSString *)message;

@end
