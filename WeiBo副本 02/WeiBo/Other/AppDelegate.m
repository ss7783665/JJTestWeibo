//
//  AppDelegate.m
//  WeiBo
//
//  Created by 王京 on 15/7/27.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "AppDelegate.h"
#import "JJTabBarController.h"
#import "JJNewFeatureController.h"

#define kShortVersion @"CFBundleShortVersionString"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //拿到当前info里的版本号
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSString *currentVersion = [infoDic valueForKey:kShortVersion];
    //创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //从偏好设置里去数据标价
    NSString *saveVersion = [[NSUserDefaults standardUserDefaults] stringForKey:kShortVersion];
    
    //比较字符串
    NSComparisonResult result =  [saveVersion compare:currentVersion];
    
    //在没有保存,(第一次启动),,或者升序,保存的小于升级后的
    if (!saveVersion || result == NSOrderedAscending) {
        self.window.rootViewController = [JJNewFeatureController new];
        //保存当前版本号到偏好设置
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:kShortVersion];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }else{
        self.window.rootViewController = [JJTabBarController new];
    }
    //可视化
    [self.window makeKeyAndVisible];
    return YES;
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
