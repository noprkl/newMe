//
//  AppDelegate.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "AppDelegate.h"
#import "LXqTimpViewController.h"
#import "LXqMyViewController.h"
#import "LXqBuyViewController.h"
#import "LXqClassViewController.h"
#import "LXqBaseTabBarController.h"
#import "LXqBaseNavigationController.h"

/** 友盟 */
#import <UMSocial.h>
#import <UMSocialSinaSSOHandler.h>
#import <UMSocialWechatHandler.h>
#import <UMSocialQQHandler.h>
@interface AppDelegate ()
/** 标签栏 */
@property (strong, nonatomic) UITabBarController *tabbC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#pragma mark - 控制器
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //标签栏
    LXqBaseTabBarController *tabC = [[LXqBaseTabBarController alloc] init];
    self.tabbC = tabC;
    //页面
    LXqTimpViewController *LXqTimeVC = [[LXqTimpViewController alloc] init];
    [self createTabbarVCWithVC:LXqTimeVC image:@"菜单栏限时特卖按钮未选中状态" selectImage:@"菜单栏限时特卖按钮选中状态" titlt:@"限时特卖"];
    
    LXqClassViewController *LXqClassVC = [[LXqClassViewController alloc] init];
    [self createTabbarVCWithVC:LXqClassVC image:@"菜单栏分类按钮未选中状态"selectImage:@"菜单栏分类按钮选中状态" titlt:@"分类"];
    
    LXqBuyViewController *LXqBuyVC = [[LXqBuyViewController alloc] init];
    [self createTabbarVCWithVC:LXqBuyVC image:@"菜单栏购物车按钮未选中状态" selectImage:@"菜单栏购物车按钮选中状态" titlt:@"购物车"];
   
    LXqMyViewController *LXqMyVC = [[LXqMyViewController alloc] init];
    [self createTabbarVCWithVC:LXqMyVC image:@"菜单栏我的按钮未选中状态" selectImage:@"菜单栏我的按钮选中状态" titlt:@"我"];
    
    
    //添加到标签栏上
//    NSArray *controllers = @[LXqTimeVC, LXqClassVC, LXqBuyVC, LXqMyVC];
//    tabC.viewControllers = controllers;
    //设置主控制器
    self.window.rootViewController = tabC;
    //显示window
    [self.window makeKeyAndVisible];
    
#pragma mark - 友盟
    
    //设置友盟社会化组件appkey
    [UMSocialData setAppKey:@"57b84dde67e58e1dfc000603"];

    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
    
    //设置手机QQ 的AppId，Appkey，和分享URL，需要#import "UMSocialQQHandler.h"
    [UMSocialQQHandler setQQWithAppId:@"1105631950" appKey:@"XjWk0MI6NN04lyYi" url:@"http://www.umeng.com/social"];
    
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。需要 #import "UMSocialSinaSSOHandler.h"
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3152310877"
                                              secret:@"d96614f0cb3e34ccdd32cf09c88307c5"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    return YES;
}
- (void)createTabbarVCWithVC:(UIViewController *)vc image:(NSString *)image selectImage:(NSString *)selectImage titlt:(NSString *)title
{
    LXqBaseNavigationController *nav = [[LXqBaseNavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_backImage"]];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    NSDictionary *titleDic = @{
                               NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor colorWithRed:132/255.0 green:132/255.0 blue:132/255.0 alpha:1]
                               };
    [vc.tabBarItem setTitleTextAttributes:titleDic forState:UIControlStateNormal];
    
    NSDictionary *titleSelectDic = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor colorWithRed:56/255.0 green:165/255.0 blue:241/255.0 alpha:1]
                               };
    [vc.tabBarItem setTitleTextAttributes:titleSelectDic forState:UIControlStateSelected];
    vc.tabBarItem.title = title;
    [self.tabbC addChildViewController:nav];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}

@end
