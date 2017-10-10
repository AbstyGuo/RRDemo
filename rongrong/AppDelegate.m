//
//  AppDelegate.m
//  rongrong
//
//  Created by guoyongfeng on 16/7/14.
//  Copyright © 2016年 guoyongfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "DDMenuController.h"
#import "RRMyViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //设置导航栏属性
    [[UINavigationBar appearance] setBackgroundImage:[RRTool imageWithColor:NavigationBarColor size:CGSizeMake(100, 64)] forBarMetrics:UIBarMetricsDefault];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    //先实例化主页面
    UINavigationController * nav = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
    //实例化右侧界面
    RRMyViewController * my = [[UIStoryboard storyboardWithName:@"MyRR" bundle:nil] instantiateInitialViewController];
    
    //实例化侧滑框架
    _DDController = [[YRSideViewController alloc]init];
    
    //给这个框架设置主页面和侧滑菜单页面
    _DDController.rightViewController = my;
    _DDController.rightViewShowWidth = MainScreenWidth - 45;
    [_DDController setRootViewController:nav];
    _window.rootViewController = _DDController;
        
    
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
