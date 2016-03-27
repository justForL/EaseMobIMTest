//
//  AppDelegate.m
//  EaseMobIM
//
//  Created by James on 16/3/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "LJBaseTabBarController.h"
#import "LJLoginTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
#define kEaseMobAppKey @"2032251#bangbangbang"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //registerSDKWithAppKey:注册的appKey，详细见下面注释。
    //apnsCertName:推送证书名(不需要加后缀)，详细见下面注释。
    [[EaseMob sharedInstance] registerSDKWithAppKey:kEaseMobAppKey apnsCertName:@""];
    [[EaseMob sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeRootViewController) name:kIsChangeRootViewController object:nil];
    
    if ([[EaseMob sharedInstance].chatManager isAutoLoginEnabled]) {
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        //主页面
        LJBaseTabBarController *tabBarVc = [[LJBaseTabBarController alloc]init];
        self.window.rootViewController = tabBarVc;
        [[EaseMob sharedInstance].chatManager asyncFetchBuddyList];
        [self.window makeKeyAndVisible];
        return YES;

    }else {
    [self changeRootViewController];
    }
    return YES;
}


- (void)changeRootViewController {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    LJLoginTool *tool =[LJLoginTool shared];
    [tool loginOrNot];
    
    if (tool.isLogin) {
        //主页面
        LJBaseTabBarController *tabBarVc = [[LJBaseTabBarController alloc]init];
        self.window.rootViewController = tabBarVc;
        [[EaseMob sharedInstance].chatManager asyncFetchBuddyList];
    }else {
        //登录界面
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LoginView" bundle:nil];
        UIViewController *vc = [sb instantiateInitialViewController];
        self.window.rootViewController = vc;
        //获取好友列表
        [[EaseMob sharedInstance].chatManager asyncFetchBuddyList];
        //移除通知
//        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    
    [self.window makeKeyAndVisible];

}

// App进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[EaseMob sharedInstance] applicationDidEnterBackground:application];
}

// App将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[EaseMob sharedInstance] applicationWillEnterForeground:application];
}

// 申请处理时间
- (void)applicationWillTerminate:(UIApplication *)application
{
    [[EaseMob sharedInstance] applicationWillTerminate:application];
}
@end
