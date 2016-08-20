//
//  LXqBaseViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/20.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqBaseViewController.h"

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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
