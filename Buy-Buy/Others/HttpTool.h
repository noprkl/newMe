//
//  HttpTool.h
//  04-二次封装AFNetworking
//
//  Created by ma c on 16/8/4.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^HttpSuccessBlock)(id json);
typedef void (^HttpFailedBlock)(NSError *error);
typedef void (^HttpDownloadProgressBlock)(CGFloat progress);
typedef void (^HttpUploadProgressBlock)(CGFloat progress);

@interface HttpTool : NSObject
/**
 *  get网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */

+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)succsee
             failed:(HttpFailedBlock)failed;
/**
 *  post网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */
+ (void)postWithPath:(NSString *)path
             paramse:(NSDictionary *)parames
             success:(HttpSuccessBlock)success
             failure:(HttpFailedBlock)failure;
/**
 *  下载文件
 *
 *  @param path     url路径
 *  @param success  下载成功
 *  @param failure  下载失败
 *  @param progress 下载进度
 */
+ (void)downloadWithPath:(NSString *)path
                 success:(HttpSuccessBlock)success
                  failed:(HttpFailedBlock)failur
                progress:(HttpDownloadProgressBlock)progress;
/**
 *  上传图片
 *
 *  @param path     url地址
 *  @param image    UIImage对象
 *  @param thumbName    imagekey
 *  @param params  上传参数
 *  @param success  上传成功
 *  @param failure  上传失败
 *  @param progress 上传进度
 */
+ (void)uploadWithPath:(NSString *)path
                params:(NSDictionary *)params
          tempimageKey:(NSString *)tempimageKey
                 image:(UIImage *)image
               success:(HttpSuccessBlock)success
                failed:(HttpFailedBlock)failur
              progress:(HttpUploadProgressBlock)progress;

@end
