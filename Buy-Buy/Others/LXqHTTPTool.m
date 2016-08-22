//
//  LXqHTTPTool.m
//  Buy-Buy
//
//  Created by ma c on 16/8/20.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqHTTPTool.h"

@implementation LXqHTTPTool
//单例模式manager初始化
+ (instancetype)shareAFNManager
{
    static LXqHTTPTool *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LXqHTTPTool alloc] initWithBaseURL:[NSURL URLWithString:BASEURL]];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/jsons", @"text/javascript",@"text/plain",@"image/gif", nil];
        //  安全系数
        manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    });
    return manager;
}
+ (void)getRequestWithPath:(NSString *)path
                    params:(NSDictionary *)params
                   success:(HttpRequestSuccessBlock)returnSuccess
                     error:(HttpRequestErrorBlock)returnError;
{
    LXqHTTPTool *manager = [LXqHTTPTool shareAFNManager];
    
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            returnSuccess(responseObject);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
            returnError(error);
        
        
    }];


}
+ (void)postRequestWithPath:(NSString *)path
                     params:(NSDictionary *)params
                    success:(HttpRequestSuccessBlock)returnSuccess
                      error:(HttpRequestErrorBlock)returnError;
{
    
    LXqHTTPTool *manager = [LXqHTTPTool shareAFNManager];
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (returnSuccess) {
            returnSuccess(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (returnError) {
            returnError(error);
        }
    
    }];

}
@end
