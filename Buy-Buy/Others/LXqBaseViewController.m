//
//  LXqBaseViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/20.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqBaseViewController.h"
#import <UMSocialSnsPlatformManager.h>
#import <UMSocialAccountManager.h>

@interface LXqBaseViewController ()

@end

@implementation LXqBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)getRequestWithPath:(NSString *)path
                    params:(NSDictionary *)params
                   success:(HttpRequestSuccessBlock)returnSuccess
                     error:(HttpRequestErrorBlock)returnError
{
   
    [LXqHTTPTool getRequestWithPath:path params:params success:^(id successJson) {
        returnError(successJson);
    } error:^(NSError *error) {
        returnError(error);
    }];

    
    
}
- (void)postRequestWithPath:(NSString *)path
                     params:(NSDictionary *)params
                    success:(HttpRequestSuccessBlock)returnSuccess
                      error:(HttpRequestErrorBlock)returnError;
{
    [LXqHTTPTool postRequestWithPath:path params:params success:^(id successJson) {
        returnError(successJson);
    } error:^(NSError *error) {
        returnError(error);
    }];
}
- (void)QQLoginMethod
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
}
- (void)WXLoginMethod
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }
        
    });
}
- (void)SinaLoginMethod
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
