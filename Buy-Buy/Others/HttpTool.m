//
//  HttpTool.m
//  04-二次封装AFNetworking
//
//  Created by ma c on 16/8/4.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking/AFNetworking.h"
static NSString *baseURL = @"http://192.168.1.171";
/** 类簇 */
@interface  AFHTTPClient : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end
@implementation AFHTTPClient

+ (instancetype)sharedClient
{
    static AFHTTPClient *cliedt;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *confi = [NSURLSessionConfiguration defaultSessionConfiguration];
        cliedt = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseURL] sessionConfiguration:confi];
        //接收参数类型
        cliedt.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/jsons", @"text/javascript",@"text/plain",@"image/gif", nil];
        //安全系数
        cliedt.securityPolicy = [AFSecurityPolicy defaultPolicy];
        
    });
    return cliedt;
}

@end

@implementation HttpTool
+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)succsee
             failed:(HttpFailedBlock)failed
{
    NSString * url = [baseURL stringByAppendingPathComponent:path];
    [[AFHTTPClient sharedClient] GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succsee(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];

}
+ (void)postWithPath:(NSString *)path
             paramse:(NSDictionary *)parames
             success:(HttpSuccessBlock)success
             failure:(HttpFailedBlock)failure
{
    NSString * url = [baseURL stringByAppendingPathComponent:path];
    [[AFHTTPClient sharedClient] POST:url parameters:parames progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
+ (void)downloadWithPath:(NSString *)path
                 success:(HttpSuccessBlock)success
                  failed:(HttpFailedBlock)failur
                progress:(HttpDownloadProgressBlock)progress
{
    NSString * string = [baseURL stringByAppendingPathComponent:path];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[[AFHTTPClient sharedClient] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress.fractionCompleted);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
       
        NSURL *cacheURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:nil error:NULL];
        return [cacheURL URLByAppendingPathComponent:response.suggestedFilename];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        failur(error);
    }] resume];
    
}
+ (void)uploadWithPath:(NSString *)path
                params:(NSDictionary *)params
          tempimageKey:(NSString *)tempimageKey
                 image:(UIImage *)image
               success:(HttpSuccessBlock)success
                failed:(HttpFailedBlock)failur
              progress:(HttpUploadProgressBlock)progress
{
    //获取完整的url路径
    NSString *string = [baseURL stringByAppendingString:path];
    NSData *data = UIImagePNGRepresentation(image);
    
    [[[AFHTTPClient sharedClient] POST:string parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:tempimageKey fileName:@"01.png" mimeType:@"image.png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    progress(uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failur(error);
    }] resume];
}
@end
