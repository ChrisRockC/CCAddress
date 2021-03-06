//
//  AppDelegate.m
//  Address
//
//  Created by CC on 16/6/8.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "AppDelegate.h"
#import "CCHomeController.h"
#import <AddressBook/AddressBook.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //1. 指定入口
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    CCHomeController *home = [[CCHomeController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:home];
    nav.hidesBottomBarWhenPushed = YES;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];

    //2. 移除webview cache
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    //3. 授权获取通讯录权限
    if ([[UIDevice currentDevice].systemVersion floatValue]>=6.0) {
        //1)获取授权状态
        ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();
        //2)创建AddressBook
        ABAddressBookRef ref = ABAddressBookCreateWithOptions(NULL,NULL);
        //3)没有授权就授权
        if (status == kABAuthorizationStatusNotDetermined) {
            ABAddressBookRequestAccessWithCompletion(ref, ^(bool granted, CFErrorRef error) {
                if (error) {  //判断是否出错
                    return;
                }
                if (granted) { //判断是否授权
                    NSLog(@"已经授权");
                    CFRelease(ref);
                }
            });
        }
        CFRelease(ref);
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

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
