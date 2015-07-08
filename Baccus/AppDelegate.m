//
//  AppDelegate.m
//  Baccus
//
//  Created by David de Tena on 03/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "AppDelegate.h"
#import "DTCWineModel.h"
#import "DTCWineViewController.h"
#import "DTCWineryModel.h"
#import "DTCWineryTableViewController.h"
#import "DTCWebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Create model
    DTCWineryModel *winery = [[DTCWineryModel alloc] init];
    
    // Create custom controllers for winery and wine
    DTCWineryTableViewController *wineryVC = [[DTCWineryTableViewController alloc] initWithModel:winery
                                                                                           style:UITableViewStylePlain];
    // Wine saved in NSUserDefaults is the wine to be displayed when the app is launched
    DTCWineViewController *wineVC = [[DTCWineViewController alloc] initWithModel:[wineryVC lastSelectedWine]];
    
    // Embed controllers into NavigationControllers
    UINavigationController *wineryNav = [[UINavigationController alloc] initWithRootViewController:wineryVC];
    UINavigationController *wineNav = [[UINavigationController alloc] initWithRootViewController:wineVC];
    
    // UISplitVC
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[wineryNav,wineNav];
    
    // Set delegates
    // WineVC is the delegate for both the splitVC and the TableVC
    splitVC.delegate = wineVC;
    wineryVC.delegate = wineVC;
    
    
    // Set navigation as root view controller
    self.window.rootViewController = splitVC;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
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
