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
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    UITabBarController *tabC = [[UITabBarController alloc] init];
    LXqTimpViewController *LXqTimeVC = [[LXqTimpViewController alloc] init];
//    LXqTimeVC.tabBarItem.image = [UIImage imageNamed:@"菜单栏限时特卖按钮未选中状态"];
//    LXqTimeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"菜单栏限时特卖按钮选中状态"];
//    LXqTimeVC.tabBarItem.title = @"限时特卖";
    [self createTabbarVCWithVC:LXqTimeVC image:@"菜单栏限时特卖按钮未选中状态" selectImage:@"菜单栏限时特卖按钮选中状态" titlt:@"限时特卖"];
    
    LXqClassViewController *LXqClassVC = [[LXqClassViewController alloc] init];
    [self createTabbarVCWithVC:LXqClassVC image:@"菜单栏分类按钮未选中状态"selectImage:@"菜单栏分类按钮选中状态" titlt:@"分类"];
    LXqBuyViewController *LXqBuyVC = [[LXqBuyViewController alloc] init];
    [self createTabbarVCWithVC:LXqBuyVC image:@"菜单栏购物车按钮未选中状态" selectImage:@"菜单栏购物车按钮选中状态" titlt:@"购物车"];
    
    LXqMyViewController *LXqMyVC = [[LXqMyViewController alloc] init];
    [self createTabbarVCWithVC:LXqMyVC image:@"菜单栏我的按钮未选中状态" selectImage:@"菜单栏我的按钮选中状态" titlt:@"我"];
    
    
    
//    [tabC addChildViewController:LXqTimeVC];
    NSArray *controllers = @[LXqTimeVC, LXqClassVC, LXqBuyVC, LXqMyVC];
    tabC.viewControllers = controllers;

    
    
    
    self.window.rootViewController = tabC;
    [self.window makeKeyAndVisible];
    
    return YES;
}
- (void)createTabbarVCWithVC:(UIViewController *)vc image:(NSString *)image selectImage:(NSString *)selectImage titlt:(NSString *)title
{
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

}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
