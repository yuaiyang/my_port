//
//  AppDelegate.m
//  my_port
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "AppDelegate.h"
#import "DaohangViewController.h"
#import "DrawerRootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
     DaohangViewController *con = story.instantiateInitialViewController;
    //
    [self.window setRootViewController:con];
    
    // 判断数据库中是否保存了用户第一次登陆
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL first =[userDefaults integerForKey:@"first"];
    
    if (first == YES) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DrawerRootViewController *rootVC = story.instantiateInitialViewController;
        [self.window setRootViewController:rootVC];
    }
    

    
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    [user setBool:NO forKey:@"isNight"];
    
    //[NSThread sleepForTimeInterval:2.0];//设置启动页面时间
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
