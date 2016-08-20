//
//  LXqHTTPTool.h
//  Buy-Buy
//
//  Created by ma c on 16/8/20.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^HttpRequestSuccessBlock)(id successJson);
typedef void(^HttpRequestErrorBlock)(NSError *error);

@interface LXqHTTPTool : AFHTTPSessionManager
/**
 *  get请求
 *
 *  @param path    请求地址
 *  @param params  请求参数
 *  @param success 返回成功的参数
 *  @param error   失败的参数
 */
+ (void)getRequestWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpRequestSuccessBlock)returnSuccess
             error:(HttpRequestErrorBlock)returnError;
/**
 *  post请求
 *
 *  @param path    请求地址
 *  @param params  请求参数
 *  @param success 返回成功的参数
 *  @param error   失败的参数
 */
+ (void)postRequestWithPath:(NSString *)path
                     params:(NSDictionary *)params
                    success:(HttpRequestSuccessBlock)returnSuccess
                      error:(HttpRequestErrorBlock)returnError;
@end
